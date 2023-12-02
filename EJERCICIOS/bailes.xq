(: 1.Mostrar cada uno de los nombres de los bailes con la etiqueta "losbailes" :)
(:for $baile in //baile
return <losbailes>{data($baile/nombre)}</losbailes>:)

(:2.Mostrar los nombres de los bailes seguidos con el número de plazas entre paréntesis, ambos dentro de la misma
etiqueta "losbailes":)
(:for $baile in //baile
return <losbailes>{$baile/nombre/text()} ({$baile/plazas/text()})</losbailes>:)
(:3.Mostrar los nombres de los bailes cuyo precio sea mayor de 30 y la moneda "euro":)
(:for $baile in //baile
where $baile/precio > 30 and $baile/precio/@moneda = "euro"
return $baile/nombre:)
(: 4.- Mostrar los nombres de los bailes cuyo precio sea mayor de 30 y la moneda "euro".:)

(:for $baile in //baile
where $baile/precio > 30 and $baile/precio/@moneda = 'euro'
return $baile/nombre/text():)
(:for $baile in //baile[precio > 30 and precio/@moneda = "euro"]
return $baile/nombre:)

(: 5.- Mostrar los nombres y la fecha de comienzo de los bailes que comiencen el mes de enero (utiliza para buscarlo la cadena de texto "/1/").:)
(:for $baile in //baile
where contains($baile/comienzo,"/1/"):)
(:return string-join(($baile/nombre/text(),$baile/comienzo/text()),"-"):)
(:return <salida>{$baile/nombre/text()},{$baile/comienzo/text()}</salida>:)

(:6.Mostrar los nombres de los profesores y la sala en la que dan clase, ordénalos por sala.:)
(:<html>

<body>
<h1>Bailes</h1>
<table>
<tr>
<td>Profesor</td>
<td>Sala</td>
</tr>
{for $baile in //baile
order by $baile/sala
return
  
    <tr>
      <td>{$baile/profesor/text()}</td>
      <td>{$baile/sala/text()}</td>
    </tr>
}
</table>
</body>
</html>:)

(:7.Mostrar los nombres de los profesores eliminando los repetidos y acompañar cada nombre con todas las salas en la que da clase, ordénalos por nombre.:)

(:for $profesor in distinct-values(//profesor)
let $salas := //baile[profesor=$profesor]/sala
order by $profesor descending
return 
<profesor>
<nombre>{$profesor}</nombre>
{$salas}
</profesor>:)

(:8.Mostrar la media de los precios de todos los bailes:)
(:let $baile := //baile
return <media>{avg($baile/precio/text())}</media>:)

(:9.Mostrar la suma de los precios de los bailes de la sala 1:)
(:let $baile := //baile[sala=1]
return <suma_precios_sala1>{sum($baile/precio)}</suma_precios_sala1>:)

(:10.Mostrar cuántas plazas en total oferta el profesor "Jesus Lozano":)
(:let $plazas := //baile[profesor="Jesus Lozano"]/plazas
return <plazas>{sum($plazas)}</plazas>:)

(:11. Mostrar el dinero que ganaría la profesora "Laura Mendiola" si se completaran todas las plazas de su baile, sabiendo
que sólo tiene un baile.:)

(:let $baileLaura := //baile[profesor = "Laura Mendiola"]
return <dinero>{$baileLaura/plazas * $baileLaura/precio}</dinero>:)

(:12.Mostrar el dinero que ganaría el profesor "Jesus Lozano" si se completaran todas las plazas de su baile, pero mostrando el beneficio de cada baile por separado:)
(:for $baile in //baile
where $baile/profesor = "Jesus Lozano"
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>:)

(:13.Mostrar el dinero que ganaría la profesora "Laura" (no conocemos su apellido) si se completaran todas las plazas de su baile.:)
(:for $baile in //baile
where $baile/profesor = "Laura Mendiola"
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>:)
(:for $baile in //baile
where contains($baile/profesor,"Laura")
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>:)
(:for $baile in //baile
where starts-with($baile/profesor,"Laura")
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>:)
(:14.Mostrar el nombre del baile, su precio y el precio con un descuento del 15% para familias numerosas. Ordenar por el nombre del baile:)
(:for $baile in //baile
order by $baile/nombre
  let $nombre := $baile/nombre/text()
  let $precio := $baile/precio/text()
  let $descuento := $precio * 0.15
let $precioFinal := $precio - $descuento
return 
  <baile>
  <nombre>{$nombre}</nombre>
  <precio>{$precio}</precio>
  <precioConDto>{$precioFinal}</precioConDto>
</baile>:)
(:for $baile in //baile
order by $baile/nombre
return
<info>
  {$baile/nombre}
  {$baile/precio}
  <precioDescuento>{$baile/precio * 0.85}</precioDescuento>
</info>:)

(:15.Mostrar todos los datos de cada baile excepto la fecha de comienzo y de fin:)
(:for $baile in /bailes/baile
return <baile>{$baile/* except $baile/comienzo except $baile/fin}</baile>:)
(:16.Mostrar en una tabla de HTML los nombres de los bailes y su profesor, cada uno en una fila:)
<table>
{
  for $baile in //baile
  return
    <tr>
      <td>{$baile/nombre/text()}</td>
      <td>{$baile/profesor/text()}</td>
    </tr>
}
</table>
