{% extends 'pyxchange/base.tpl' %}
{% block title %}Add your image to Pyxchange{% endblock %}

{% block body %}
    <h3>Add an image</h3>
    <form action="" method="post" enctype="multipart/form-data">
        {% csrf_token %}
        <input type="file" name="image" />
        <label for="desc">Image descrition</label>
        <input name="desc" id="desc" type="text" />
        <button type="submit">Upload</button>
    </form>
{% endblock %}