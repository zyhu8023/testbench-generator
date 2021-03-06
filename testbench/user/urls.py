"""testbench URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url
from user.views import RegisterView,IndexView,LoginView,LogoutView,NoFilesView,HaveFilesView,ConverterView,DownLoadView

urlpatterns = [
    url(r'^register/$', RegisterView.as_view(),name='register'),
    url(r'^login/$',LoginView.as_view(),name='login'),
    url(r'^logout$', LogoutView.as_view(), name='logout'), # 注销登录
    url(r'^nofiles(?P<token>.*)$',NoFilesView.as_view(),name='nofiles'),#无文件上传界面
    url(r'^havefiles$',HaveFilesView.as_view(),name='havefiles'),#有文件时上传界面
    url(r'^converter/$',ConverterView.as_view(),name='converter'),#文件转换界面
    url(r'^download/(?P<token>.*)$',DownLoadView.as_view(),name='download'),#文件下载
    url(r'^',IndexView.as_view(),name='index'),

]
