{% extends 'pyxchange/base.tpl' %}
{% block title %}Your images{% endblock %}
{% block cabinet_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        {% if images %}
            <h2>Your Uploads</h2>
            {% for image in images %}
                <div class="thumbnail animated flipInX">
                    <div>
                        <a href="{% url 'pyxchange:detail' image.slug %}">
                            <img src="{{ image.img_thumb_medium.url }}" title="{{ image.desc }}" />
                        </a>
                    </div>
                    <div class="del text-center">
                        <a href="{% url 'pyxchange:delete' image.slug %}">
                            <b class="text-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></b>
                        </a>
                    </div>
                </div>
            {% endfor %}
        {% else %}
            <h4>You don’t have images</h4>
        {% endif %}
    </div>
{% endblock %}