from django.conf.urls import url
from . import views

app_name = 'pyxchange'

urlpatterns = [
    url(r'^add/$', views.ImageCreate.as_view(), name='image_add'),
    url(r'^$', views.index, name='index'),
    url(r'^popular/$', views.popular, name='popular'),
    url(r'^(\w+)/$', views.pic_detail, name='pic_detail'),
]
