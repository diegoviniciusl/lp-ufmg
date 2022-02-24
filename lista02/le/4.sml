datatype UnOp = Not;
datatype BinOp = Add | Sub | Mul | Gt | Eq | Or;
datatype Sexpr = IConst of int | Op1 of UnOp * Sexpr | Op2 of BinOp * Sexpr
* Sexpr;

fun simplify (IConst e) = IConst e
 | simplify (Op2(Sub, e, IConst 0)) = simplify e
 | simplify (Op2(Mul, IConst 1, e)) = simplify e
 | simplify (Op2(Mul, e, IConst 1)) = simplify e
 | simplify (Op2(Mul, IConst 0, e)) = IConst 0
 | simplify (Op2(Mul, e, IConst 0)) = IConst 0
 | simplify (Op2(Add, IConst 0, e)) = simplify e
 | simplify (Op2(Add, e, IConst 0)) = simplify e
 | simplify (Op1(Not, Op1(Not, e))) = simplify e
 | simplify (Op1(Op, e)) = (Op1(Op, simplify e))
 | simplify (Op2(Op, e1, e2)) =
if Op = Or andalso simplify e1 = simplify e2 then simplify e1 else
if Op = Sub andalso simplify e1 = simplify e2 then IConst 0 else
if simplify e1 = e1 andalso simplify e2 = e2 then Op2(Op, simplify e1, simplify e2) else simplify(Op2(Op, simplify e1, simplify e2));


simplify (Op2(Mul, IConst 4, IConst 1));

simplify (Op2(Mul, Op2(Add, IConst 1, IConst 0), Op2(Add, IConst 9, IConst 0)));

simplify (Op2(Mul, Op2 (Add, IConst 1, IConst 0), Op2 (Add, Op2 (Or, IConst 10,
IConst 12), IConst 0)));

simplify (Op1(Not, Op1(Not, IConst 5)));

simplify (Op2(Eq, IConst 1, IConst 2));