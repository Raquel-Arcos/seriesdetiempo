---
title: "Visualizing Time Series Data in R"
subtitle: "El segundo curso en el programa de Análisis de Series de Tiempo de DataCamp"
author: "Raquel Arcos Bulos"
date: 2019-12-17
fig_width: 5
fig_height: 3
knit: (function(input_file, encoding) {
  out_dir <- 'docs';
  rmarkdown::render(input_file,
 encoding=encoding,
 output_file=file.path(dirname(input_file), out_dir, 'index.html'))})
output: 
        html_document:
            keep_md: true
---



## Introducción

Este documento reúne los gráficos generados en el curso [Visualizing Time Series Data in R](https://www.datacamp.com/courses/visualizing-time-series-data-in-r) de [DataCamp](https://www.datacamp.com/), el cual forma parte del programa [Time Series with R](https://www.datacamp.com/tracks/time-series-with-r) de esta compañía dedicada a la capacitación en Ciencia de Datos. 

Los ejemplos están principalmente enfocados a aplicaciones financieras pero, una vez aprendidas las técnicas de procesamiento y visualización, es posible trabajar con datos para las ciencias sociales. Se requieren las librerías de R: `xts`, `zoo`, `TTR` y `Performance Analytics`. El diseño especial de los gráficos se logra gracias a la última.

El trabajo tiene por objeto construir un archivo en [R Markdown](https://rmarkdown.rstudio.com/index.html) que pueda ser visto como una página web por los visitantes de `GitHub` sin que deban descargar ningún archivo o correr código en R. El usuario en `GitHub` es Raquel-Arcos.

La conexión entre _R Studio_ y `GitHub` se realizó utilizando los implementos que el IDE tiene para ello, lo que reduce sustancialmente la posibilidad de cometer errores al actualizar los archivos.



## Los datos
+ El primer archivo contiene los precios de acciones diarios de cuatro importantes compañías: Yahoo, Microsoft, Citigroup y Dow Chemical en el periodo enero-2015 a diciembre-2016 (dos años). 


```
##            yahoo microsoft citigroup dow_chemical
## 2015-01-02 50.17  44.30501  53.45259     42.48209
## 2015-01-05 49.13  43.89759  51.76803     41.16821
## 2015-01-06 49.21  43.25329  49.94556     40.50662
```

```
##            yahoo microsoft citigroup dow_chemical
## 2016-12-28 38.73     62.99  59.86861        57.90
## 2016-12-29 38.64     62.90  59.21050        57.42
## 2016-12-30 38.67     62.14  59.26035        57.22
```

A continuación se presentan los cuatro gráficos de series de tiempo. 
<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch4-1.png" alt="Gráfica_1"  />
<p class="caption">Gráfica_1</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch5-1.png" alt="Gráfica_2"  />
<p class="caption">Gráfica_2</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch6-1.png" alt="Gráfica_3"  />
<p class="caption">Gráfica_3</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch7-1.png" alt="Gráfica_4"  />
<p class="caption">Gráfica_4</p>
</div>


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch8-1.png" alt="Gráfica_5"  />
<p class="caption">Gráfica_5</p>
</div><div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch8-2.png" alt="Gráfica_5"  />
<p class="caption">Gráfica_5</p>
</div>


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch9-1.png" alt="Gráfica_6"  />
<p class="caption">Gráfica_6</p>
</div><div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch9-2.png" alt="Gráfica_6"  />
<p class="caption">Gráfica_6</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch10-1.png" alt="Gráfica_7"  />
<p class="caption">Gráfica_7</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch11-1.png" alt="Gráfica_8"  />
<p class="caption">Gráfica_8</p>
</div>


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch12-1.png" alt="Gráfica_10"  />
<p class="caption">Gráfica_10</p>
</div>
+ El segundo conjunto de datos contiene los precios diarios de acciones de la compañía Apple del 2 de enero de 2015 al 27 de enero de 2017.


<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch14-1.png" alt="Gráfica_11"  />
<p class="caption">Gráfica_11</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch15-1.png" alt="Gráfica_12"  />
<p class="caption">Gráfica_12</p>
</div>

Para observar la distribución de los retornos de los precios de las acciones de la compañía Apple, elaboramos un histograma de los mismos junto con la función de densidad correspondiente.

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch16-1.png" alt="Gráfica_13"  />
<p class="caption">Gráfica_13</p>
</div>


Para observar en qué medida se asemeja la distribución de los retornos de los precios de las acciones de la compañía Apple a un conjunto de datos que siguen una distribución normal estándar, comparamos los gráficos de caja y brazo (boxplot) respectivos, lo que nos ayuda a visualizar tanto el sesgo como la asimetría de los datos de interés.

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch18-1.png" alt="Gráfica_14"  />
<p class="caption">Gráfica_14</p>
</div>

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch19-1.png" alt="Gráfica_15"  />
<p class="caption">Gráfica_15</p>
</div>
Un gráfico **q-q plot** contrasta los cuantiles de un primer conjunto de datos con los de un segundo conjunto de datos. Se usa para estudiar si los datos de interés se asemejan a una distribucion normal. Si los datos de interés siguen aproximadamente una distribución normal, los puntos en el gráfico se apegarán a una recta diagonal. Esta vía es útil para verificar de forma visual la normalidad, pero no es una prueba estadística.

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch20-1.png" alt="Gráfica_16"  />
<p class="caption">Gráfica_16</p>
</div>
+ El tercer conjunto de datos contiene los retornos diarios de los precios de las acciones de la compañía estadounidense ExxonMobil del 5 de enero de 2015 al 30 de diciembre de 2016. En seguida se visualizan los cuatro gráficos estudiados para realizar un diagnóstico de series de tiempo. 

<div class="figure" style="text-align: center">
<img src="D:/Documentos/Raquel/Estudios/Estadistica/R/datacamp/series_de_tiempo/seriesdetiempo/docs/index_files/figure-html/ch21-1.png" alt="Gráfica_17"  />
<p class="caption">Gráfica_17</p>
</div>







