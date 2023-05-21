---
layout: page
permalink: /publications/
title: publications
description: Publications in reversed chronological order.
years: [2022,2021,2020,2019,2018]
years_wp: [2022]
key_words: ['Working papers', 'Policy papers']
nav: True
---

<div class="publications">

{% for paper in page.key_words %}
  <h1 class="title" style="font-family:'Playfair Display', serif">{{ paper }}</h1>
  {% if paper contains 'Policy' %}
    {% for y in page.years %}
      <h2 class="year">{{y}}</h2>
      {% bibliography -f papers -q @*[year~={{ y }}, key_words = {{ paper }}]* %}
    {% endfor %}
  {% endif %}

  {% if paper contains 'Working' %}
    {% for y in page.years_wp %}
      <h2 class="year">{{y}}</h2>
      {% bibliography -f papers -q @*[year~={{ y }}, key_words = {{ paper }}]* %}
    {% endfor %}
  {% endif %}
{% endfor %}

</div>
