from django.db import models


class Picstorage(models.Model):
    pic = models.ImageField()
    desc = models.CharField(max_length=1000)
    key = models.SlugField(unique=True)
    upload_date = models.DateTimeField()
    last_review_date = models.DateTimeField()
    review_count = models.PositiveIntegerField(default=0)
    like_count = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.pic
