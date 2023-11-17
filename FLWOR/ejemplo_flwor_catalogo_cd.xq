xquery version "1.0";
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