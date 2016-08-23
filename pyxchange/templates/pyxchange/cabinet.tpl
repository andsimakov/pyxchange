{% extends 'pyxchange/base.tpl' %}
{% block title %}Your images{% endblock %}
{% block all_active %}active{% endblock %}

{% block body %}
    <div class="col-sm-offset-2 col-sm-10">
        <h4>Your uploads</h4>
        <table border="collapse" border="0" width="50%">
            <tbody>
                {% for image in images %}
                    <tr>
                        <td width="160"><a href="{% url 'pyxchange:detail' image.slug %}"><img src="{{ image.img.url }}" width="150" title="{{ image.desc }}" /></a></td>
                        <td>{{ image.desc }}</td>
                        <td><a href="{% url 'pyxchange:delete' image.slug %}">Delete</a></td>
                    </tr>
                {% endfor %}
            </tbody>
        </table>
        <br />
        <h4>Your likes</h4>
    </div>
{% endblock %}