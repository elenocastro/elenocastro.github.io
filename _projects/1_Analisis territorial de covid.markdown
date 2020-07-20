---
layout: page2
title: Casos de COVID a nivel municipal en El Salvador 
description: Una mirada en gráficos a la evolución de casos de COVID en El Salvador
img: /assets/img/mapa_covid_casos.png
importance: 1

---
*** 

<h4 class="card-title text" style="font-family:'Playfair Display', serif">Casos por 100 mil habitantes </h4>

{% include mapa_covid.html %}
<div class="caption">
    Gobierno de El Salvador (2020). Casos de COVID-19 en El Salvador. Obtenido de: https://covid19.gob.sv/  
</div>

***

<h4 class="card-title text" style="font-family:'Playfair Display', serif">Casos por semana</h4> 
{% include municipios2.html %}
{% include municipios3.html %}
<div class="caption">
    Gobierno de El Salvador (2020). Casos de COVID-19 en El Salvador. Obtenido de: https://covid19.gob.sv/  
</div>

***

<h4 class="card-title text" style="font-family:'Playfair Display', serif">Evolución de casos acumulados</h4>

<br/>
{% include municipios_line.html %}
<br/>
{% include municipios_line_per_capita.html %}
<div class="caption">
    Gobierno de El Salvador (2020). Casos de COVID-19 en El Salvador. Obtenido de: https://covid19.gob.sv/  
</div>
