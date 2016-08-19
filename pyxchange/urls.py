from django.conf.urls import url
from . import views

app_name = 'pyxchange'

urlpatterns = [
    # url(r'^$', views.index, name='index'),
    url(r'^$', views.ImageCreate.as_view(), name='index'),

    url(r'^detail/(?P<slug>[0-9a-zA-Z]+)/$', views.DetailView.as_view(), name='detail'),

    url(r'^popular/$', views.show_popular, name='popular'),

    url(r'^all/$', views.show_all, name='all'),
]
