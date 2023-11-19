# Expresión FLWOR
La expresión FLWOR es la columna vertebral de XQuery. Esta expresión conforma las consultas XQuery para la obtención de datos a partir de un XML, podríamos considerarlo una operación similar a una consulta SQL en bases de datos relacionales, aunque tiene algunas diferencias.

FLWOR es un acrónimo de las distintas cláusulas que pueden conformar la consulta. El significado de cada una de estas es:
- F (For): Especifica qué elementos de la secuencia queremos seleccionar.
- L (let): Se emplea para crear variables o almacenar parte de las secuencias.
- W (where): Filtra la información en base a las condiciones que indiquemos.
- O (order by): Ordena los resultados en base a las condiciones que indiquemos.
- R (return): Especifica el formato del resultado que vamos a generar tras la ejecución de la consulta.

Es muy importante entender que de todas las cláusulas de la expresión FLWOR, la única obligatoria es return, todas las demas son opcionales, y las emplearemos en base a nuestras necesidades para cada consulta que queramos diseñar.

En el siguiente código tenemos una sentencia XQuery que emplea todas las cláusulas de una expresión FLWOR. Esta se aplica sobre la base de datos XML cd_catalog.xml.

```
for $cd in doc("../cd_catalog.xml")/CATALOG/CD
   let $titulo := $cd/TITLE/text()
   let $precio := $cd/PRICE/text()
   where xs:decimal($precio) gt 10.00
   order by $titulo
   return
      <disco_compacto>
         <titulo>{$titulo}</titulo>
         <precio>{$precio}</precio>
      </disco_compacto>
```
Existen algunas alternativas para la ejecución del bucle for. Lo primero que debemos entender es que XQuery difiere del lenguaje Java en su paradigma, Java es un lenguaje imperativo, mientras que XQuery es un lenguaje funcional, esto provoca que cada iteración de un bucle en XQuery no es una ejecución de instrucciones una tras otra, estas iteraciones se hacen en paralelo y no existe una posible comunicación entre las distintas iteraciones.

En el siguiente ejemplo podemos definir un rango de ejecución, podría ser útil si queremos obtener los tres primeros CDs, o algún caso similar.
```
<list>
   {for $i in (1 to 10)
      return
        <value>{$i}</value>
    }
</list>
```
En el siguiente ejemplo usamos la variable count para conocer el índice de una iteración dentro de cada ejecución de la misma.
```
<items>
{
let $items := ("apples","pears","oranges")
for $item at $count in $items
return
   <item id="{$count}">
      {$item}
   </item>
}
</items>
```

### Licencia
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Licencia de Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />Este obra está bajo una <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">licencia de Creative Commons Reconocimiento-NoComercial-CompartirIgual 4.0 Internacional</a>.
