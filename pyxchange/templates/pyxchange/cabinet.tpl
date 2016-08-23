{% extends 'pyxchange/base.tpl' %}
{% block title %}Your images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        {% if images %}
            <h4>Your Uploads</h4>
            {% for image in images %}
                <div class="thumb">
                    <div><a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img.url }}" width="150" title="{{ image.desc }}" /></a></div>
                    <div class="del"><a href="{% url 'pyxchange:delete' image.slug %}"><b class="text-danger">×</b></a></div>
                </div>
            {% endfor %}
        {% else %}
            <h4>You don’t have images</h4>
        {% endif %}
    </div>
{% endblock %}