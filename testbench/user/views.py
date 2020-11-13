from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from django.http import JsonResponse
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View
from django.http import FileResponse,HttpResponse

from utils.genHdlInstRun import Create_inst
from user.models import User,Upload_files,Conveter_files

import os
from django.conf import settings
# Create your views here.
class RegisterView(View):
    #注册
    def get(self,request):
        return render(request,'register.html')

    def post(self,request):
        '''进行注册信息处理'''
        #接收数据
        username = request.POST.get('username')
        password = request.POST.get('pwd')
        phone = request.POST.get('phone')
        allow = request.POST.get('allow')

        #进行数据校验
        if not all([username,password,phone]):
            #数据不完整
            return render(request,'register.html',{'errmsg':'数据不完整'})

        if allow != 'on':
            return render(request, 'register.html', {'errmsg': '请同意协议'})

        # 校验用户名是否重复
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            # 用户名不存在
            user = None

        if user:
            # 用户名已存在
            return render(request, 'register.html', {'errmsg': '用户名已存在'})

        #将数据存入数据库
        #create_user和create生成的密码不同，前者有加密
        #使用create_user必须按用户名、邮箱、密码来创建
        user = User.objects.create_user(username=username,email=None,password=password)
        user.phone = phone
        user.save()
        # 不加密使用authenticate（）会报错，密码和用户名正确会返回用户名
        auth = authenticate(username=username, password=password)
        #使用login，session存入数据
        login(request, auth)
        return redirect(reverse('user:index'))


class LoginView(View):
    '''登录'''
    def get(self,request):
        '''显示登录界面'''
        user = request.user
        render(request,'index.html',{'user':user})

    def post(self,request):
        '''接收数据'''
        username = request.POST.get('username')
        password = request.POST.get('pwd')
        print(username,password)
        #校验数据
        if not all([username,password]):
            return render(request,'index.html',{'errmsg':'数据不完整'})

        #业务处理
        auth = authenticate(username=username, password=password)
        # print(type(auth))
        if auth is not None:
            # print('1')
            login(request,auth)
            #获取登录后所要跳转的地址
            #默认跳转到首页
            next_url = request.GET.get('next',reverse('user:index'))
            response = redirect(next_url)
            return response
        else :
            print('2')
            return render(request,'index.html',{'errmsg':'1','display':'block'})


# /user/logout
class LogoutView(View):
    '''退出登录'''
    def get(self, request):
        '''退出登录'''
        # 清除用户的session信息
        logout(request)

        # 跳转到首页
        return redirect(reverse('user:index'))


class IndexView(View):

    def get(self,requset):
        return render(requset,'index.html')


class NoFilesView(View):
    '''无文件时界面'''
    #form post上传

    def post(self,request,token):
        #接收信息
        user = request.user
        #获取文件需要使用FILES.get()
        f = request.FILES.get('file')

        if f is None:
            return render(request, 'index.html', {'filemsg': '请选择需要上传的文件'})

        if not user.is_authenticated():
            return render(request, 'index.html', {'filemsg': '请先登录'})

        #检测文件是否已经存在
        try:
            exist = Upload_files.objects.get(file_name=f.name)
        except Upload_files.DoesNotExist:
            exist = None

        if exist :
            print('文件存在')
            contents = {'filename': exist.file_name, 'filesize': exist.file_size, 'file_display': '1'}
            return render(request, 'index.html', contents)
        else:
            print('文件不存在时')
            filename = str(f.name)
            #拼接文件路径
            filepath = os.path.join(settings.FILESPATH, filename)
            file = open(filepath, 'wb')
            for chunk in f.chunks():
                file.write(chunk)
                file.close()
            size = os.path.getsize(filepath)
            #文件大小单位转换为KB
            filesize = '%.2f' % float(size/1024)
            print(filesize)
            upload_file = Upload_files.objects.create(user=user,
                                               file_name=filename,
                                               file_size=filesize,)


            contents = {'filename':filename,'filesize':filesize,'file_display':'1'}
            return render(request,'index.html',contents)


class HaveFilesView(View):
    '''有文件时上传'''

    def post(self,request):
        #接收参数
        user = request.user
        f = request.FILES.get('file')

        if f is None:
            return render(request, 'index.html', {'filemsg': '请选择需要上传的文件'})

        if user is None:
            return render(request, 'index.html', {'filemsg': '请先登录'})

        try:
            is_exist = Upload_files.objects.get(file_name=f.name)
        except Upload_files.DoesNotExist:
            is_exist = None

        if is_exist:
            print('文件存在')
            contents = {'filename': is_exist.file_name, 'filesize': is_exist.file_size,'have_display': '1','file_display':'1'}
            return render(request, 'index.html', contents)
        else:
            print('文件不存在时')
            filename = str(f.name)
            filepath = os.path.join(settings.FILESPATH, filename)
            file = open(filepath, 'wb')
            for chunk in f.chunks():
                file.write(chunk)
                file.close()
            size = os.path.getsize(filepath)
            filesize = '%.2f'% float(size/1024)
            print(filesize)
            upload_file = Upload_files.objects.create(user=user,
                                                      file_name=filename,
                                                      file_size=filesize, )

            contents = {'filename': filename, 'filesize': filesize, 'have_display': '1','file_display':'1'}
            return render(request, 'index.html', contents)

#/converter
#数据来自ajax。post
class ConverterView(View):
    '''文件转换部分'''
    def post(self,request):
        #接收参数
        user = request.user
        if not user.is_authenticated():
            #用户未登录
            return JsonResponse({'res':0,'errmsg':'用户未登录'})
        #接收参数
        filename = request.POST.get('filename')

        if filename is None:
            return JsonResponse({'res':1,'errmsg':'文件不存在'})

        try:
            is_exist = Conveter_files.objects.get(file_name=filename)
        except Conveter_files.DoesNotExist:
            is_exist = None

        if is_exist:
            print('文件存在')
            contents = {'filename': is_exist.file_name, 'filesize': is_exist.file_size,'res':2}
            return JsonResponse(contents)
        else:
            print('文件不存在时')
            #生成转换文件
            con_filename = Create_inst(filename)
            #获取上传文件表
            upload = Upload_files.objects.get(file_name=filename)
            #获取路径和大小
            filepath = os.path.join(settings.CONVERTERPATH, con_filename)
            con_filesize = os.path.getsize(filepath)
            con_filesize = '%.2f' %float(con_filesize/1024)

            Conveter_files.objects.create(user=user,
                                          upload_ID=upload,
                                          file_name=con_filename,
                                          file_size=con_filesize, )
            contents = {'res':2,'con_filename': con_filename, 'con_filesize': con_filesize}
            #返回json
            return JsonResponse(contents)

#/download/file_name
class DownLoadView(View):
    '''下载文件'''
    def get(self,request,token):
        '''/download/?con_filename'''
        print(str(token)+'**')

        filepath = os.path.join(settings.CONVERTERPATH,token)
        print(filepath)
        if token is None:
            return HttpResponse('文件不存在')

        file = open(filepath, 'rb')
        response = FileResponse(file)
        response['Content-Type'] = 'application/octet-stream'
        response['Content-Disposition'] = 'attachment;filename='+token
        return response

    def post(self,request):
        '''ajax上传'''
        pass
