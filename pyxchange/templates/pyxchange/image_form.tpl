{% extends 'pyxchange/base.tpl' %}
{% block title %}Pyxchange Image Share. Add Yours{% endblock %}

{% block body %}
    <h3>Add Image Form</h3>
    <form action="" method="post" enctype="multipart/form-data">
        {% csrf_token %}
        {% include 'pyxchange/form_template.tpl' %}
        <button type="submit">Upload</button>
    </form>
    <br />
    {% for pict in images %}
        <a href="{% url 'pyxchange:detail' pict.slug %}"><img src="{{ pict.img.url }}" width="100" alt="{{ pict.desc }}" title="{{ pict.desc }}" /></a>
    {% endfor %}
{% endblock %}