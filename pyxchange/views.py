from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return HttpResponse('Main View')


def popular(request):
    return HttpResponse('Popular Image View')


def pic_detail(request, key):
    return HttpResponse('Image Page View')
