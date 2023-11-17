xquery version "1.0";
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