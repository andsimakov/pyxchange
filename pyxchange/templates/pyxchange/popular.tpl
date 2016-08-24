{% extends 'pyxchange/base.tpl' %}
{% block title %}Most Popular Images{% endblock %}
{% block popular_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h4>Most Popular Images</h4>
        {% for image in images %}
            <a href="{% url 'pyxchange:detail' image.slug %}">
                <img class="thumbnail" src="{{ image.img_thumb_large.url }}" title="{{ image.desc }}" />
            </a>
        {% endfor %}
    </div>
{% endblock %}