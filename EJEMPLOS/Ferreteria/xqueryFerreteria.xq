(: esto es un compentario :)
for $producto in doc("pFerreteria.xml")//producto
let
    $nombre := $producto/nombre,
    $precio := $producto/precio    
return
      string-join(($nombre,$precio)," - ")