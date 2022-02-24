fun split (xs: int list) = 
  let
    fun spl (head::tail) = 
      if null tail then [head]
      else if (null (tl tail)) then head::[]
      else head::(spl(tl tail))
  in
    if null xs then ([], [])
    else if (null (tl xs)) then (xs, [])
    else (spl xs, spl (tl xs)) 
end;

split([]);
split([1]);
split([1,2]);
split([1,4,3]);
split([1,4,3,9]);
