from django.contrib.auth.models import Permission, User
from django.db import models
from random import randint
from django.utils.baseconv import base56
from django.core.urlresolvers import reverse


class Image(models.Model):
    # For future auth feature implementation
    # user = models.ForeignKey(User, default=1)
    img = models.ImageField('Image', upload_to='%I')
    desc = models.CharField('Description', max_length=500, help_text='Up to 500 fancy schmancy characters')
    key = models.SlugField(max_length=6, unique=True, help_text='Automatically generated')
    upl_date = models.DateTimeField('Uploaded')
    rev_date = models.DateTimeField('Last reviewed')
    rev_count = models.PositiveIntegerField('Reviews', default=0)
    like_count = models.PositiveIntegerField('Likes', default=0)

    def get_absolute_url(self):
        return reverse('pyxchange:index', kwargs={'pk': self.pk})

    def __str__(self):
        return '{} - {}'.format(self.key, self.desc)

    @staticmethod
    def create_key():
        key = base56.encode(randint(0, 0x7fffffff))
        return key

