signature MathLibSig = 
sig
  val fact: int -> int
  val halfPi: real
  val double: int -> int
  val pow: int * int -> int
end;

structure MyMathLib :> MathLibSig =
struct
  fun fact 0 = 1
    | fact x = x * fact(x - 1)
  val halfPi = Math.pi / 2.0
  fun double x = x * 2
  fun pow(x, 0) = 1
    | pow (x, y) = x * pow (x, y - 1)
end;