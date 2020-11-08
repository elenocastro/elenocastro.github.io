---
layout: distill_img_short
title: "¿Quiénes caerán en el sector informal de la economía?"
description: La pandemia dejará a muchas personas sin trabajo formal, la mayoría de ellos es verán obligados a trabajar en el sector informal para llevar alimento a sus casas.
date: 2020-11-07
comments: true

authors:
  - name: Eleno Castro
    url: https://twitter.com/ElenoCastro

image: /assets/img/post_informalidad/post_informalidad.jpg
bibliography: 2020-11-07-informalidad-covid.bib
---
<p class="first-p"><span class="first-word">L</span>a pandemia afectara de forma anormal la vida de las personas especialmente para aquellos que se verán obligados a dejar sus trabajos y entraran al sector informal. Antes de la pandemia la situación ya era preocupante, El Salvador es el segundo país de América Latina con la tasa de más alta de informalidad entre las personas viviendo en pobreza, cerca del 70% (solo superado por Honduras). Más 90% de estos trabajadores no tienen ningún tipo de asistencia social, la tasa más alta de la región (VOX, 2020).<d-cite key="VOX"></d-cite>. </p>

Aun no se puede saber con certidumbre como afectara la pandemia la vida laboral de las personas debido a la falta de datos frecuentes sobre empleo. Las estadísticas de cotizantes del ISSS que se publican mensualmente, muestran una caída de los cotizantes y actualmente pareciera estar recuperándose.

Sin embargo, los datos solo cuentan una versión parcial del mercado laboral, aun falta saber que pasa en el sector informal. La tasa de desempleo en El Salvador se ha mantenido históricamente baja debido principalmente a que los posibles desempleados encuentran trabajo en el sector informal.

Mi sospecha es que esto suceda durante la pandemia también. Las personas se verán obligadas a dejar sus trabajos para incorporarse en el sector informal. Las personas con mayor riesgo son aquellas con salarios no tan altos que trabajan en el sector privado. 

Debido a la pandemia puedo sospechar que la DIGESTYC interrumpió las encuestas de hogares<d-cite key="EHPM"></d-cite>, por lo tanto, no sabremos que pasa hasta la próxima publicación que podría estar lista hasta el 2022. 

No obstante, con la última publicación podemos saber algunas cosas. Al menos podríamos estimar quienes tienen más probabilidades de caer en el sector informal debido a sus características (como sexo, edad, educación, salario actual y donde vive) y a las estimaciones de las crisis económicas. (Revisar el modelo al final del blog)

De acuerdo, al modelo si asumimos estimaciones como las de LatinFocus<d-cite key="FocusEconomics"></d-cite>, en las que El Salvador tendrá una crisis económica del -5% y una caída en los salarios del 20.5%, el número de trabajadores que pasará del sector formal al sector informal será aproximadamente 80 mil. El cual coincide con la caída de cotizantes del Seguro Social de Febrero a Junio. Este número, sin embargo, ha mejorado sustancialmente en los meses más recientes.  

Se estima que el 63% de los trabajadores que caerán en el sector informal serán hombres y el 37% serán mujeres. Esto no se debe a que los hombres sean mas vulnerables que las mujeres, posiblemente todo lo contrario, los hombres al acceder a más trabajos formales serían más afectados en términos absolutos. 

Aquellas personas que ganaban antes de la pandemia entre 300 y 500 dólares en el sector formal serán las que más se verán forzadas a trabajar en el sector informal. De los afectados el 51%, podría estar en este rango de salarios para los hombres y el 48% de las mujeres. 

<img class="img-fluid" src="{{ site.baseurl }}/assets/img/post_informalidad/hombres_informal.png">

<img class="img-fluid" src="{{ site.baseurl }}/assets/img/post_informalidad/mujeres_informal.png">

<br>

#### Porcentaje de personas empleadas segun nivel de ingreso previo a la crisis

| Nivel de Ingreso | Empleo total (formal e informal) | Empleo formal (sector privado)|
|-------|--------|---------|
| <200 | 35% | 1% |
| 200 - 300 | 18% | 6% |
| 300 - 300 | 34% | 69% |
| 500 - 300 | 8% | 15% |
| 700 - 300 | 2% | 4% |
| >900 | 3% | 5% |

## Modelo
Para calcular la gente que podría caer en el sector informal, se hizo el supuesto que estas personas no estarán desempleadas y que pertenecen únicamente al sector privado. Debido a que se sabe que el sector publico no ha despedido personal y el desempleo se ha mantenido bajo en El Salvador incluso durante la crisis del 2009. Se utilizo el siguiente modelo Probit:

$$
Informal_i = β_0 + β_1 ingreso_i + β_2 edad_i + β_3 sexo_i +  β_4 depa_i + β_5 pobre_i
$$

Donde: 

- $$Informal_i$$: variable dicotómica que toma el valor de 1 si la persona trabaja en el sector informal y 0 si trabaja el sector formal.
- $$ingreso_i$$: logaritmo del ingreso de la persona
- $$edad_i$$: edad de la persona
- $$sexo_i$$: variable dicotómica del sexo de la persona
- $$zona_i$$: variable dicotómica que toma el valor de 1 si la persona vive en la zona urbana y 0 si vive en la zona rural
- $$depa_i$$: múltiples variables dicotómicas, que toma el valor 1 dependiendo de si vive en ese departamento la persona
- $$pobre_i$$: variable dicotómica que toma el valor de 1 si la familia vive en pobreza

