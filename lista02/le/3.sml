datatype expr = RConst of real |
                PQuadrado of expr |
                PRetangulo of expr * expr |
                PCirculo of expr |
                PTriangulo of expr * expr * expr;

fun eval (RConst i) = i
 | eval (PQuadrado (e)) = 4.0 * eval (e)
 | eval (PRetangulo (e1, e2)) = 2.0 * eval (e1) * eval (e2)
 | eval (PCirculo (e)) = 3.14 * 2.0 * eval (e)
 | eval (PTriangulo (e1 , e2 , e3)) = (eval e1) + (eval e2) + (eval e3);

val p = PQuadrado(RConst 4.0);
eval p;