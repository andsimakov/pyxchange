{% extends 'pyxchange/base.tpl' %}
{% block title %}Most Popular Images{% endblock %}
{% block popular_active %}active{% endblock %}

{% block body %}
    {% for pict in images %}
        <a href="{% url 'pyxchange:detail' pict.slug %}"><img src="{{ pict.img.url }}" width="100"  alt="{{ pict.desc }}" title="{{ pict.desc }} /></a>
    {% endfor %}
    <br /><br />
    <a href="{% url 'pyxchange:all' %}">All Images</a>
{% endblock %}