from random import randint
from django.utils.baseconv import base56


def generate_slug():
    slug = base56.encode(randint(0, 0x7fffffff))
    return slug
