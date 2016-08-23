{% extends 'pyxchange/base_user.tpl' %}
{% block title %}Pyxchange Sign Up{% endblock %}
{% block register_active %}active{% endblock %}

{% block body %}
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3>Sign Up</h3>
                    {% if error_message %}
                        <p><b>{{ error_message }}</b></p>
                    {% endif %}
                    <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                        {% csrf_token %}
                        {% include 'pyxchange/form_template.tpl' %}
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">
                     <a href="{% url 'pyxchange:login_user' %}">Click here</a> to log in instead.
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}