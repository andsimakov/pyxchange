from django.contrib.auth.models import Permission, User
from django.db import models


class Image(models.Model):
    # For future auth feature implementation
    # user = models.ForeignKey(User, default=1)
    pic = models.ImageField()
    desc = models.CharField(max_length=1000)
    key = models.SlugField(unique=True)
    upload_date = models.DateTimeField()
    last_review_date = models.DateTimeField()
    review_count = models.PositiveIntegerField(default=0)
    like_count = models.PositiveIntegerField(default=0)

    def __str__(self):
        return '{} - {}'.format(self.key, self.desc)
