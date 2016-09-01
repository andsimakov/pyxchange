<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
  <meta name="format-detection" content="telephone=no" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <title>{% block title %}Pyxchange{% endblock %}</title>
  {% load staticfiles %}
  <link rel="shortcut icon" type="image/png" href="{% static 'pyxchange/images/favicon.png' %}"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Baloo+Da|Open+Sans:400,700" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="{% static '{{ STATIC_URL }}pyxchange/style.css' %}"/>
  <link rel="stylesheet" type="text/css" href="{% static 'pyxchange/font-awesome.css' %}"/>
  <link rel="stylesheet" type="text/css" href="{% static 'pyxchange/animate.css' %}"/>
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
        <li class="{% block all_active %}{% endblock %}">
          <a href="{% url 'pyxchange:all' %}">
            <i class="fa fa-picture-o" aria-hidden="true"></i> All
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav">
        <li class="{% block popular_active %}{% endblock %}">
          <a href="{% url 'pyxchange:popular' %}">
            <i class="fa fa-star" aria-hidden="true"></i> Popular
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav">
        <li class="{% block like_active %}{% endblock %}">
          <a href="{% url 'pyxchange:like' %}">
            <i class="fa fa-heart" aria-hidden="true"></i> Like
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        {% if user.is_authenticated %}
          <li class="active">
            <a href="{% url 'pyxchange:cabinet' %}">
              <i class="fa fa-male" aria-hidden="true"></i> {{ user }}
            </a>
          </li>
          <li>
            <a href="{% url 'pyxchange:logout_user' %}">
              <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
            </a>
          </li>
        {% else %}
          <li>
            <a href="{% url 'pyxchange:login_user' %}">
              <i class="fa fa-sign-in" aria-hidden="true"></i> Log In
            </a>
          </li>
          <li>
            <a href="{% url 'pyxchange:register' %}">
              <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up
            </a>
          </li>
        {% endif %}
      </ul>
    </div>
  </div>
</nav>
{% block body %}
{% endblock %}
</body>
</html>
