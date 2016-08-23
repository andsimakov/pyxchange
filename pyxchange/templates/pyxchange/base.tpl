<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>{% block title %}Pyxchange{% endblock %}</title>
        {% load staticfiles %}
        <link rel="shortcut icon" type="image/png" href="{%  static 'favicon.png' %}"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Baloo+Da|Open+Sans:400,700" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="{% static 'pyxchange/style.css' %}"/>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Header -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#topNavBar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="{% url 'pyxchange:index' %}">Pyxchange</a>
                </div>
                <!-- Items -->
                <div class="collapse navbar-collapse" id="topNavBar">
                    <ul class="nav navbar-nav">
                        <li class="{% block popular_active %}{% endblock %}"><a href="{% url 'pyxchange:popular' %}">Popular</a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li class="{% block all_active %}{% endblock %}"><a href="{% url 'pyxchange:all' %}">All</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        {% if user.is_authenticated %}
                            <li><a href="{% url 'pyxchange:cabinet' %}">{{ user }}</a></li>
                            <li>
                                <a href="{% url 'pyxchange:logout_user' %}">Logout</a>
                            </li>
                        {% else %}
                            <li><a href="{% url 'pyxchange:login_user' %}">Log in</a></li>
                        {% endif %}
                    </ul>
                </div>
            </div>
        </nav>
        {% block body %}
        {% endblock %}
    </body>
</html>
