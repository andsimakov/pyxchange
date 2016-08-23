{% extends 'pyxchange/base.tpl' %}
{% block title %}Your images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h4>Your Uploads</h4>
        <table border="collapse" border="0" width="50%">
            <tbody>
                {% for image in images %}
                    <div class="thumb">
                        <div><a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img.url }}" width="150" title="{{ image.desc }}" /></a></div>
                        <div class="del"><a href="{% url 'pyxchange:delete' image.slug %}"><b class="text-danger">×</b></a></div>
                    </div>
                {% endfor %}
            </tbody>
        </table>
        <br />
        <h4>Your Likes</h4>
    </div>
{% endblock %}