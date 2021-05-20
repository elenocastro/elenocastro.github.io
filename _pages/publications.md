---
layout: page
permalink: /publications/
title: publications
description: Publications in reversed chronological order.
years: [2021,2020,2019,2018,2016,2014]
nav: True
---

<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
