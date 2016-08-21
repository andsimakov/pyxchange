{% extends 'pyxchange/base.tpl' %}
{% block title %}{{ image.slug }}{% endblock %}

{% block body %}
    <a href="javascript:window.history.back()"><img src="{{ image.img.url }}" width="600" alt="Back" title="Back"></a>
    <h1>{{ image.desc }}</h1>
    <ul>
        <li>Uploaded: {{ image.upl_date }}</li>
        <li>File size: {{ image.img.size|filesizeformat }}</li>
        <li>Dimensions: {{ image.img.width }}px (W) x {{ image.img.height }}px (H)</li>
        <li>Views: {{ image.rev_count }}</li>
    </ul>

    <form action="" method="post">
        {% csrf_token %}
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>
{% endblock %}