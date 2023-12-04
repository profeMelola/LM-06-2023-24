```
(:1 :)
for $titulo in /bookstore/book/title/text()
return <titulo>{$titulo}</titulo>

(:2 :)
for $libro in /bookstore/book
where $libro/price <= 30
return $libro

(:3 :)
for $libro in /bookstore/book
where $libro/price <= 30
return $libro/title

for $libro in /bookstore/book[price<=30]
return $libro/title

(:4 :)
for $libro in /bookstore/book[price<=30]
return <title>{$libro/title/text()}</title>

(:5 :)
for $libro in /bookstore/book[year=2005]
return <lib2005>{$libro/title,$libro/author}</lib2005>

for $libro in /bookstore/book
where $libro/year=2005
return <lib2005>{$libro/title}{$libro/author}</lib2005>

(:6 :)
for $year in /bookstore/book/year
return <publicacion>{$year}</publicacion>

let $year := /bookstore/book/year
return <publicacion>{$year}</publicacion>

(:7 :)
for $libro in /bookstore/book
order by $libro/@category,$libro/title
return $libro

(:8 :)
let $num_libro := count(/bookstore/book)
return <total>{$num_libro}</total>

(:9 :)
let $total := count (/bookstore/book),
    $titulos := (
      for $libro in /bookstore/book/title 
      return <titulo>{$libro/text()}</titulo>) 
return 
      <resultado>
        {$titulos}
        <total_libros>{$total}</total_libros>
      </resultado>

(:10 :)
let $max := max(/bookstore/book/price), 
    $min := min(/bookstore/book/price)
return
<resultado>
  <max>{$max}</max>
  <min>{$min}</min>
</resultado>

(:11 :)
for $libro in /bookstore/book
let $precio_iva := ($libro/price * 1.21)
order by $precio_iva
return 
<libro>
  <titulo>{$libro/title/text()}</titulo>
  <precio>{$libro/price/text()} €</precio>
  <precio_iva>{$precio_iva} €</precio_iva>
</libro>

for $libro in /bookstore/book
order by $libro/price * 1.21
return 
<libro>
  <titulo>{$libro/title/text()}</titulo>
  <precio>{$libro/price/text()} €</precio>
  <precio_iva>{$libro/price * 1.21} €</precio_iva>
</libro>

(:12 :)
let $libros := /bookstore/book
return <total>{sum($libros/price)}</total>

(:13 :)
<libros>
{
  for $libro in /bookstore/book
  return $libro/price
}
{
  let $libros := /bookstore/book
  return <total>{sum($libros/price)}</total>
}
</libros>

(:14 :)
for $libro in /bookstore/book
return 
  <libro>
    {$libro/title}
    <autores>{count($libro/author)}</autores>
  </libro>

(:15 :)
for $libro in /bookstore/book
return <libro>{$libro/title/text()} ({count($libro/author)})</libro>

(:16 :)
for $libro in /bookstore/book
where ends-with($libro/year, "3")
return $libro

for $libro in /bookstore/book[ends-with(year, "3")]
return $libro

(:17 :)
for $libro in /bookstore/book
where starts-with($libro/@category, "C")
return $libro

for $libro in /bookstore/book[starts-with(@category, "C")]
return $libro

(:18 :)
for $libro in /bookstore/book
where contains($libro/title, "x") or contains($libro/title, "X")
order by $libro/title descending
return $libro

for $libro in /bookstore/book
where contains(lower-case($libro/title), "x")
order by $libro/title descending
return $libro

for $libro in /bookstore/book[contains(lower-case(title), "x")]
order by $libro/title descending
return $libro

(:19 :)
for $libro in /bookstore/book
return 
  <libro>
    {$libro/title}
    <length>{string-length($libro/title)}</length>
  </libro>

(:20 :)
for $año in distinct-values(/bookstore/book/year)
return <año>{$año}</año>

(:21 :)
for $autor in distinct-values(/bookstore/book/author)
order by string-length($autor)
return <autor>{$autor}</autor>

(:22 :)
for $autor in distinct-values(/bookstore/book/author)
order by string-length($autor)
return <autor>{$autor}</autor>
```

