fun greater(x: int, y: int) = if x > y then x else y;

fun max (start::[]) = start
| max(start::final) = 
let
  val a = max(final)
in
  greater(start, a)
end;

max([1,2,3]);