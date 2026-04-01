---
layout: page
permalink: /policy-papers/
title: policy papers
description: Policy papers in reversed chronological order.
key_words: ['Policy papers']
nav: True
hide_page_header: true
---

<div class="publications">

{% for paper in page.key_words %}
  <h1 class="title" style="font-family:'Source Serif 4', serif">{{ paper }}</h1>
  {% bibliography -f papers --query @*[key_words = {{ paper }}]* %}
{% endfor %}

</div>
