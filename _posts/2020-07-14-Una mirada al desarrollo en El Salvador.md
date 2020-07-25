---
layout: distill
title: "Desarrollo social en El Salvador: una mirada municipal"
description: A contrario de lo que muchos opinan El Salvador ha tenido avances en los últimos años sin embargo el desarrollo ha sido heterogéneo entre los municipios.
date: 2020-07-14
comments: true

authors:
  - name: Eleno Castro
    url: https://twitter.com/ElenoCastro

image: "elenocastro.com/assets/img/post_5.jpg"
bibliography: 2020-07-14-Una-mirada-al-desarrollo-en-El-Salvador.bib
---
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ site.baseurl }}/assets/img/post_5.jpg">
    </div>
</div>

<br/>
Pesé al gran pesimismo que maneja la gente de El Salvador debido a los problemas de corrupción y la poca credibilidad de las instituciones públicas, el país ha tenido avances en términos de desarrollo social en los últimos años. 

Esto es algo que debemos de destacar y mencionar, sobre todo para desmentir aquellas personas que aseguran que estamos peor que nunca. No hay duda de que aún falta mucho camino por recorrer y que hay retos que no se atendieron de la mejor forma durante los últimos años, pero si podemos destacar algunos avances.

### Comparando manzanas con manzanas. ¿Qué ha pasado con el crecimiento económico de El Salvador?

Usualmente se señala que El Salvador ha tenido el peor desempeño económico de la región, teniendo un constante bajo crecimiento en los últimos años, mientras que países vecinos como Honduras, Guatemala y Nicaragua han podido crecer más. Sin embargo, este análisis deja un factor de lado y es el <b>crecimiento poblacional</b>. Los países con mayor crecimiento de población tienen también mayor crecimiento económico, porque cada vez más gente entra al mercado laboral. El Salvador es uno de los países de la región con menor crecimiento poblacional, debido a una caída en la tasa de fertilidad en los últimos años y las altas tasas de migración.

Los economistas para tomar en consideración este factor utilizan el crecimiento del PIB per cápita, pues no importa si el pastel se está haciendo más grande si ahora hay más personas para dividirlo. Cuando se considera este indicador, El Salvador lo ha hecho a un nivel muy similar a la región incluso por encima de países como Guatemala y Honduras<d-cite key="WDI"></d-cite>.

#### Promedio de crecimiento del PIB per capita al 2019 (%)
{% include post_5/gdp_percapita.html %}
<div class="caption">
    World development indicators. Washington, D.C. :The World Bank.
</div>

¿Esto quiere decir que El Salvador no tiene problemas de crecimiento? Pues es muy probable que si tenga problemas, El Salvador tiene un mercado local muy pequeño que le impide tener un sector de servicios fortalecido o pujante, y tampoco ha logrado integrarse a cadenas de producción importantes a nivel mundial y se observa en el bajo nivel de exportaciones que mantiene y la poca sofisticación de sus productos. Este diagnostico también es compartido para otros países de la región.

### La pobreza y desigualdad viene cayendo

Por otro lado, El Salvador si ha logrado disminuir la pobreza y ha mantenido una tendencia similar al de la región. Si se compara con el porcentaje de personas que viven con menos de <span>$</span>3.30 al día, el país ha logrado mantener la misma tendencia que Panamá situándose por tan solo 2 puntos porcentuales por encima de este, a pesar de que El Salvador no ha logrado tener el mismo crecimiento económico de Panamá. No se puede decir lo mismo para el porcentaje de personas que viven con menos de <span>$</span>5.50 al día, donde el país aún cuenta con un alto porcentaje de su población en dicha condición<d-cite key="WDI"></d-cite>.

{% include post_5/pobreza_wb.html %}
<div class="caption">
    World development indicators. Washington, D.C. :The World Bank.
</div>

La desigualdad medida por el [GINI](https://es.wikipedia.org/wiki/Coeficiente_de_Gini) también ha caído en El Salvador de forma admirable frente a todos los países de la región, El Salvador mantienen un indicador de 8 puntos más bajo que Nicaragua (el segundo más bajo de Centroamérica). Esto podría explicar porque a pesar del modesto crecimiento económico si ha logrado disminuir los niveles más extremos de pobreza<d-cite key="WDI"></d-cite>. 

#### Evolución de la desigualdad: GINI index
{% include post_5/gini_wb_eng.html %}
<div class="caption">
    World development indicators. Washington, D.C. :The World Bank.
</div>

### ¿Dónde esta ocurriendo el desarrollo económico y social en El Salvador?

El desarrollo económico y social usualmente no es homogéneo incluso dentro de un mismo país y esto lo podemos ver incluso en el pequeño país de El Salvador. Poco se reflexiona que municipios están teniendo mejor desempeño económico y social y por lo tanto es imposible responder a la pregunta que políticas públicas locales están teniendo efecto.

Los municipios son heterogéneos entre sí, algunos más que otros. El Salvador cuenta con municipios con ciudades densamente pobladas, otros con un alto nivel turismo local, algunos con un sistema educativo con un alto porcentaje de escuelas unidocente y municipios con altos niveles de remesas. Sin embargo, poco se pregunta cómo les está yendo individualmente a cada uno y quien lo está haciendo mejor.

Mi objetivo no es responder a estas preguntas, pero si brindar un punto de partida para futuros investigadores que quieran adentrarse hacer este tipo de investigación. El país cuenta con una valiosa herramienta: <b>las Encuestas de Hogares de Propósitos Múltiples</b>. Sin embargo, muy poco se ha utilizado el nivel más granular de representatividad de dichas encuestas. Estas recolectan datos de forma representativa para 50 municipios, cabe mencionar que estos municipios concentran una gran parte de la población y que podría bastar para hacer un análisis exploratorio. En este blog he tomado los municipios con los mejores indicadores para hacer un breve análisis. 

### ¿Qué está ocurriendo en los municipios?

Lo municipios han logrado bajar la pobreza como es de esperarse debido a la tendencia nacional. Los municipios que se mantienen a la cabeza son Antiguo Cuscatlán, San Salvador y Santa Tecla con 5%, 11% y 15% de pobreza respectivamente, seguidos por Mejicanos y Ayutuxtepeque.
Algunos municipios en los que se destaca una disminución importante en los niveles de pobreza son: San Miguel, Nejapa, Santiago Nonualco, Ilopango y Sonsonate con una caída de al menos 15 puntos porcentuales en dichos municipios<d-cite key="EHPM"></d-cite>.

#### Nivel de pobreza, 2010 vs 2018
{% include project_3/pobreza_2010_2018_eng.html %}
<div class="caption">
    Dirección General de Estadística y Censo de El Salvador (2010 - 2018). Encuesta de Hogares de Propósitos Múltiples.
</div>

Se observa un modesto crecimiento en el ingreso promedio<d-footnote>Ingreso del hogar divido por el número de miembros viviendo en dicho hogar</d-footnote> de los municipios del Área Metropolitana de San Salvador, a excepción de Antiguo Cuscatlán. En San Salvador, Mejicanos y Santa Tecla el ingreso promedio tan solo ha aumentado <span>$</span>51, <span>$</span>26 y <span>$</span>22 dólares respectivamente entre 2010 y 2018. Sin embargo, aún se mantienen a la cabeza como los municipios con mejores ingresos del país.

Por otro lado, para el mismo periodo municipios como Antiguo Cuscatlán e Ilopango han tenido un incremento de casi <span>$</span>156 y <span>$</span>82 respectivamente. Antiguo Cuscatlán por su parte es un municipio con un nivel de ingreso muy superior a los demás, hace 10 años ya presentaba un ingreso promedio superior al Santa Tecla de hoy en día. Y la riqueza continua concentrandose en esta zona específicamente y la brecha con los otros municipios esta ampliándose.

#### Ingreso promedio por municipio, 2010 vs 2018
{% include project_3/ingreso_promedio_municipio_eng.html %}
<div class="caption">
    Dirección General de Estadística y Censo de El Salvador (2010 - 2018). Encuesta de Hogares de Propósitos Múltiples.
</div>

En Educación, municipios como Soyapango y San Salvador no han podido mejorar el nivel de escolarización de sus habitantes, presentando un incremento de tan solo 0.4 y 0.3 años de escolaridad entre 2010 y 2018. Antiguo Cuscatlán por otro lado, también lidera los mejores indicadores de escolarización del país, teniendo un incremento muy superior a otros municipios. Es el único municipio en el que sus habitantes tienen en promedio bachillerato completo (11 años de escolaridad). Otros municipios como Cuscatancingo, Cojutepeque y Santo Tomas también han tenido un incremento importante en la escolaridad de sus habitantes (1.5, 1.3 y 1.3 años respectivamente). Sin embargo, la mayoría de los municipios aún están muy lejos de tener una población con los años de educación obligatoria. 

#### Escolaridad promedio, 2010 vs 2018
{% include project_3/escolaridad_promedio_eng.html %}
<div class="caption">
    Dirección General de Estadística y Censo de El Salvador (2010 - 2018). Encuesta de Hogares de Propósitos Múltiples.
</div>

Para quienes desean explorar un poco más los datos a nivel municipal he creado más gráficos [aquí](https://www.elenocastro.com/projects/3_Indicadores%20municipales/).
