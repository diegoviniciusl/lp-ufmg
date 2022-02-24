fun count_main x =
 let
  fun count y =
    if x < y then [] else y::count(y + 1)
 in
  count 1
 end;

count_main(9);
count_main(~5);
count_main(0);
