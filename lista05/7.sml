signature MathLibSig = 
sig
  val fact: int -> int
  val halfPi: real
  val double: int -> int
  val pow: int * int -> int
end;

exception NegativeNum

structure MyMathLib :> MathLibSig =
 struct
 fun fact 0 = 1
    | fact x = if x < 0 then raise NegativeNum else x * fact (x - 1)
 val halfPi = Math.pi / 2.0
 fun double x = if x < 0 then raise NegativeNum else x * 2
 fun pow (x, 0) = 1
    | pow (x, y) = if x < 0 then raise NegativeNum else x * pow (x , y - 1)
 end;

fun useMyMathLib(x, func) =
  let fun f x "fact" = print(Int.toString(MyMathLib.fact(x)))
    | f x "pow" = print(Int.toString(MyMathLib.pow(x, x)))
    | f x "double" = print(Int.toString(MyMathLib.double(x)))
    | f x _ = raise Match
  in  
    f x func
  end
  handle NegativeNum => print("Não posso lidar com valores negativos!");

useMyMathLib(2, "pow");
useMyMathLib(~3, "fact");