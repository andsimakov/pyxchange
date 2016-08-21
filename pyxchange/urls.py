from django.conf.urls import url
from . import views

app_name = 'pyxchange'

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^popular/$', views.show_popular, name='popular'),
    url(r'^all/$', views.show_all, name='all'),
    url(r'^(?P<slug>[\w]+)/$', views.detail, name='detail'),
]
