# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   File Name：     genHdlInst
   Description :  generate hdl instance
   Author :       Rex
   date：          2019/9/20
-------------------------------------------------
   Change Activity:
                   2019/9/20:
-------------------------------------------------
"""
__author__ = 'Rex'

import re
import os
# from django.conf import settings

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
#上传文件保存路径
FILESPATH = os.path.join(BASE_DIR,'files')
#下载文件保存路径
CONVERTERPATH = os.path.join(BASE_DIR,'converter_files')

class HdlError(Exception):
    def __init__(self,ErrorInfo):
        super().__init__(self)
        self.errorinfo=ErrorInfo
    def __str__(self):
        return self.errorinfo

def rmComments(text):
    '''
    去除注释
    remove comments
    :param text: hdl content   (string)
    :return: hdl without comments (string)
    '''
    singLineComments = re.compile(r'//(.*)', re.MULTILINE)  #re.M 匹配返回单行
    multiLineComments = re.compile(r'/\*(.*)\*/', re.DOTALL) #re.s 匹配返回多行  \*匹配*
    text = singLineComments.sub('', text)
    text = multiLineComments.sub('', text)
    return text

def findModuleName(text):
    '''
    find module name
    :param text: hdl context without comments (string)
    :return: module name
    '''
    modulePos = text.find('module') #返回module对应的index
    if modulePos==-1:
        raise HdlError('Syntax error: Can not find module!')
    text = text[modulePos+7:] #module led
    # \w匹配字母和下划线 \s匹配任意空白字符 *重复零次或更多次
    #match从符合正则的字符开始
    modNameRe = re.match(r'\w*\s*', text)
    #strip(),删除开头和结尾，括号里面可以放参数
    modName = modNameRe.group(0).strip()
    return modName

def findParams(text):
    '''
    find module parameters
    :param text: hdl context without comments and keyword 'module'
    :return: all parameter list and value list
    '''
    param = r'\sparameter\s[\w\W]*?[;,)]'
    paralst = re.findall(param, text)

    if paralst!=[]:
        paramStr = '\n'.join(paralst)
        pat = r'(\w*)\s*=\s*([\w\W]*?)\s*[;,)]'
        p = re.findall(pat, paramStr)
        paramNameLst = [i[0] for i in p]
        paramValLst = [i[1] for i in p]
        return paramNameLst,paramValLst
    else:
        return [], []

def paramInstTempl(paramNameLst, paramValLst):
    '''
    generate parameters instance template
    :param paramNameLst: parameters Name list
    :param paramValLst: parameters value list
    :return: parameters instance template
    '''
    if paramValLst==[]:
        return ''
    else:
        nameLen = max(len(i) for i in paramNameLst)
        valLen = max(len(i) for i in paramValLst)
        paraInst = '#(\n' + ',\n'.join('    .' + i.ljust(nameLen)
                    + '(' + k.ljust(valLen) + ')'
                    for (i,k) in zip(paramNameLst,paramValLst)) + '\n)'
        return paraInst

def findIoPorts(text):
    '''
    IO port declare syntax:
        (input | output | inout) (wire | reg) (signed) ([High:Low]) (port1,port2,port3) = (x'hxx) (,;'')
    example:
        output reg signed [MAX_WIDTH-1:0] out1, out2 = 10'd0,
    :param text: hdl context without comments and keyword 'module'
    :return: all io ports declare, include: port_name port_width port_type
    '''
    portPair = {'input':'reg', 'output':'wire', 'inout':'inout'}
    portNameLst = []
    portWidthLst = []
    portTypeLst = []

    portPat = r'(\s*(input|output|inout)\s+)((wire|reg)\s+)*((signed)\s+)*(\[.*?:.*?\]\s*)*' \
              r'(.*\s*)(=?)(.*)(?=\binput\b|\boutput\b|\binout\b|\))'

    portLst = re.findall(portPat, text)
    if len(portLst)==0:
        raise HdlError('Syntax error: Can not find io port!')
    for port in portLst:
        portnames = re.findall(r'(\S*)',port[-3])[0].split(',')
        if portnames[-1] == '':
            portnames.pop()
        for item in portnames:
            portNameLst.append(item)
            portTypeLst.append(portPair[port[1]])
            portWidthLst.append(port[-4])
    return portNameLst, portWidthLst, portTypeLst

def portInstTempl(portNameLst, portWidthLst, portTypeLst):
    nameLen = max(len(i) for i in portNameLst)
    typeLen = 6 # input output inout
    widthLen = max(len(i) for i in portWidthLst)
    portInst = '(\n' + ',\n'.join('    .' + port.ljust(nameLen) + '(' + port.ljust(nameLen) + ')' \
                for port in portNameLst)  + '\n);'
    portDeclare = '\n' + ';\n'.join(typ.ljust(typeLen) + ' ' + width.ljust(widthLen) + ' ' + name \
                            for (typ,width,name) in zip(portTypeLst,portWidthLst,portNameLst)) + ';\n\n'

    return portDeclare,portInst


def genHdlInst(text):
    '''
    generate hld instance
    :param s: hdl file context
    :return: the instance string
    '''
    textRmComments = rmComments(text)
    moduleName = findModuleName(textRmComments)
    paramNameLst, paramValLst = findParams(textRmComments)
    portNameLst, portWidthLst, portTypeLst = findIoPorts(textRmComments)
    portDeclare, portInst = portInstTempl(portNameLst, portWidthLst, portTypeLst)
    paraInst = paramInstTempl(paramNameLst, paramValLst)

    Head_add = '''
`timescale 1ns/1ns
module %s_tb ();
                ''' % moduleName
    Center_add = '''
initial 
    begin

    end

'''
    end_add = '''
endmodule
    
'''
    instTempl = Head_add + portDeclare + Center_add + moduleName + paraInst + ' inst_' + moduleName + portInst + end_add
    return instTempl

def Create_inst(sourcefile):

    file_path = os.path.join(FILESPATH, sourcefile)
    infile = open(file_path, 'r', encoding='utf-8')

    fileCont = infile.read()
    instTempl = genHdlInst(fileCont)
    outfilename = 'inst_' + sourcefile
    outfile_path = os.path.join(CONVERTERPATH, outfilename)
    # outfile_path ='../converter_files/'+outfilename
    outfile = open(outfile_path, 'w')
    outfile.write(instTempl)
    infile.close()
    outfile.close()
    return outfilename


if __name__=='__main__':
    print(Create_inst('UART_TEST.v'))
    # print(os.path.getsize('led.v'))





