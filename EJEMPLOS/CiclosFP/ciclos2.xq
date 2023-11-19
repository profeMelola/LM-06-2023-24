(: ES NECESARIO INCLUIR EL XQUERY ENTRE LLAVES SI USO HTML :)

(: FORMA 1: obtener nombre de ciclos (con text()) :)
<ul>
{
for $nombreCiclos in doc("/home/melola/Documentos/LM_23_24/XQUERY/ciclos.xml")//ciclo/nombre/text()
order by $nombreCiclos
return <li>{$nombreCiclos}</li>
}
</ul>

(: FORMA 2: obtener nombre de ciclos (con data) :)
(:
<ul>
{
for $nombreCiclos in doc("/home/melola/Documentos/LM_23_24/XQUERY/ciclos.xml")//ciclo/nombre
order by $nombreCiclos
return <li>{data($nombreCiclos)}</li>
}
</ul>:)