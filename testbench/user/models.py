from django.db import models
from django.contrib.auth.models import AbstractUser
from db.base_model import BaseModel

# Create your models here.


#继承djiango的用户信息，以及dn文件下的BaseMo时间信息
class User(AbstractUser,BaseModel):
    '''用户模型类'''
    phone = models.CharField(max_length=11,verbose_name='手机号')
    class Meta:
        db_table = 'df_user'
        verbose_name = '用户'
        verbose_name_plural = verbose_name

class Upload_files(BaseModel):
    '''用户上传文件模型类'''
    user = models.ForeignKey('User',verbose_name='用户名')
    file_name = models.CharField(max_length=30,verbose_name='文件名')
    file_size = models.DecimalField(max_digits=10,decimal_places=2,verbose_name='文件大小')
    file = models.FileField(upload_to='files',verbose_name='文件路径')

    class Meta:
        db_table = 'df_upload'
        verbose_name = '文件上传'
        verbose_name_plural = verbose_name

class Conveter_files(BaseModel):
    '''文件转换模型类'''
    user = models.ForeignKey('User',verbose_name='用户名')
    upload_ID = models.ForeignKey('Upload_files',verbose_name='上传文件ID')
    file_name = models.CharField(max_length=30,verbose_name='文件名')
    file_size = models.DecimalField(max_digits=10,decimal_places=2,verbose_name='文件大小')
    file = models.FileField(upload_to='files', verbose_name='文件路径')

    class Meta:
        db_table = 'df_conveter'
        verbose_name = '文件转换'
        verbose_name_plural = verbose_name







