from django.contrib.auth.models import Permission, User
from django.db import models
from datetime import datetime
from django.core.urlresolvers import reverse

from .utils import generate_slug


class Image(models.Model):
    # For future auth feature implementation
    # user = models.ForeignKey(User, default=1)
    img = models.ImageField('Image',
                            upload_to='%I')
    desc = models.CharField('Description',
                            max_length=500,
                            help_text='Up to 500 fancy schmancy characters')
    slug = models.SlugField(max_length=6,
                            unique=True,
                            default=generate_slug())
    upl_date = models.DateTimeField('Uploaded',
                                    default=datetime.now)
    rev_date = models.DateTimeField('Last reviewed',
                                    null=True)
    rev_count = models.PositiveIntegerField('Reviews',
                                            default=0)
    like_count = models.PositiveIntegerField('Likes',
                                             default=0)

    def get_absolute_url(self):
        return reverse('pyxchange:detail', kwargs={'slug': self.slug})

    def __str__(self):
        return '{} - {}'.format(self.slug, self.desc)
