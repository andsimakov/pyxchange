{% extends 'pyxchange/base.tpl' %}
{% block title %}All Images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h2>All Images</h2>
        {% for image in images %}
            <a href="{% url 'pyxchange:detail' image.slug %}">
                <img class="thumbnail animated flipInY" src="{{ image.img_thumb_small.url }}" title="{{ image.desc }}" />
            </a>
        {% endfor %}
    </div>
{% endblock %}