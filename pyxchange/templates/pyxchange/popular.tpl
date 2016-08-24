{% extends 'pyxchange/base.tpl' %}
{% block title %}Most Popular Images{% endblock %}
{% block popular_active %}active{% endblock %}

{% block body %}
    <div class="container">
        <div class="row">
            <div class="col-sm-offset-1 col-sm-11">
                <h2>Most Popular Images</h2>
                {% for image in images %}
                    <a href="{% url 'pyxchange:detail' image.slug %}">
                        <img class="thumbnail animated rollIn" src="{{ image.img_thumb_large.url }}" title="{{ image.desc }}" />
                    </a>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}