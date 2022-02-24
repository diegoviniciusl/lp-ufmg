fun good_max (xs: int list) =
  if null xs then 0
  else if null (tl xs) then hd xs
  else
    let
      val max = good_max(tl xs)
    in
      if hd xs > max then hd xs
      else max
    end;

good_max([1,1,2,5]);
good_max([5,1]);
good_max([1,5]);
good_max([1,5,3]);
