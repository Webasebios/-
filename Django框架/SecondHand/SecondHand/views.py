from django.shortcuts import render

def log(request):
    return render(request, '界面/html/登录注册界面/登录.html')
