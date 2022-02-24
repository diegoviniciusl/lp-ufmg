fun pow x =
 let
  val result = 0
  fun calculePow y =
    y * y
 in
  calculePow x
 end;

pow(3);
pow(9);
pow(0);
