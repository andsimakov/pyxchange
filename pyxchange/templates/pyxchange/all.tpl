{% extends 'pyxchange/base.tpl' %}
{% block title %}All Images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h4>Full Gallery</h4>
        {% for image in images %}
            <a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img.url }}" width="130" title="{{ image.desc }}" /></a>
        {% endfor %}
    </div>
{% endblock %}