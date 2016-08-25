{% extends 'pyxchange/base_user.tpl' %}
{% block title %}Pyxchange Sign Up{% endblock %}

{% block body %}
<div class="container">
    <div class="row text-center">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default animated fadeInUp">
                <div class="panel-body">
                    <h3>Sign Up</h3>
                    {% if error_message %}
                        <p><b>{{ error_message }}</b></p>
                    {% endif %}
                    <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                        {% csrf_token %}
                        {% include 'pyxchange/form_template.tpl' %}
                        <div class="form-group">
                            <div class="col-md-4 col-md-offset-4">
                                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Sign Up</button>
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