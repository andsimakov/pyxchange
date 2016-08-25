<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>{% block title %}Pyxchange{% endblock %}</title>
  {% load staticfiles %}
  <link rel="shortcut icon" type="image/png" href="{% static 'pyxchange/images/favicon.png' %}"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Baloo+Da|Open+Sans:400,700" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="{% static 'pyxchange/style.css' %}"/>
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
            <span class="glyphicon glyphicon-picture" aria-hidden="true"></span> All
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav">
        <li class="{% block popular_active %}{% endblock %}">
          <a href="{% url 'pyxchange:popular' %}">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Popular
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav">
        <li class="{% block like_active %}{% endblock %}">
          <a href="{% url 'pyxchange:likes' %}">
            <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Like
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        {% if user.is_authenticated %}
          <li class="{% block cabinet_active %}{% endblock %}">
            <a href="{% url 'pyxchange:cabinet' %}">
              <span class="glyphicon glyphicon-user" aria-hidden="true"></span> {{ user }}
            </a>
          </li>
          <li>
            <a href="{% url 'pyxchange:logout_user' %}">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span> Logout
            </a>
          </li>
        {% else %}
          <li>
            <a href="{% url 'pyxchange:login_user' %}">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span> Log In
            </a>
          </li>
          <li>
            <a href="{% url 'pyxchange:register' %}">
              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Sign Up
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
