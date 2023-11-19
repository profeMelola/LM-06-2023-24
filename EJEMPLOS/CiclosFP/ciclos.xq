(: obtener los ciclos cuyo decreto del título sea posterior a 2009:)
(:
for $x in //ciclo
where $x/decretoTitulo[@año>2009]
order by $x/nombre
return $x
:)


(: obtener el nombre de los ciclos cuyo decreto del título sea posterior a 2009:)
(:
for $x in //ciclo
where $x/decretoTitulo[@año>2009]
order by $x/nombre
return $x/nombre/text()
:)

(: ejemplo con if-then-else:)
for $x in //ciclo
return 
if ($x/grado = "Superior")
then
<gradoSuperior>
{data($x/nombre)}
</gradoSuperior>
else
<gradoMedio>
{data($x/nombre)}
</gradoMedio>

