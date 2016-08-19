{% extends 'pyxchange/base.tpl' %}
{% block title %}All Images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
    {% for pict in images %}
        <a href="{% url 'pyxchange:detail' pict.slug %}"><img src="{{ pict.img.url }}" width="100" alt="{{ pict.desc }}" title="{{ pict.desc }}" /></a>
    {% endfor %}
{% endblock %}