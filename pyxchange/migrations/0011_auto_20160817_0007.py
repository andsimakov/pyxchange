# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-16 21:07
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pyxchange', '0010_auto_20160817_0006'),
    ]

    operations = [
        migrations.RenameField(
            model_name='image',
            old_name='pic',
            new_name='img',
        ),
        migrations.RenameField(
            model_name='image',
            old_name='review_count',
            new_name='rev_count',
        ),
        migrations.RenameField(
            model_name='image',
            old_name='last_review_date',
            new_name='rev_date',
        ),
        migrations.RenameField(
            model_name='image',
            old_name='upload_date',
            new_name='upl_date',
        ),
    ]
