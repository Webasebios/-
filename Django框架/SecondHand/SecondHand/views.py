from django.shortcuts import render


def log(request):
    return render(request, '界面/html/登录注册界面/登录.html')


def zhuye(request):
    return render(request, '界面/html/主页.html')


def baseinformation(request):
    return render(request, '界面/html/个人中心界面/个人中心-基本信息.html')


def address(request):
    return render(request, '界面/html/个人中心界面/个人中心-收货地址.html')


def accountinformation(request):
    return render(request, '界面/html/个人中心界面/个人中心-账号信息.html')


def forget_password(request):
    return render(request, '界面/html/登录注册界面/忘记密码.html')


def zhuce(request):
    return render(request, '界面/html/登录注册界面/注册.html')