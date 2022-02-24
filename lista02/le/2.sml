datatype area = RConst of real |
                AQuadrado of area |
                ARetangulo of area * area |
                ACirculo of area ;

fun eval (RConst a) = a
 | eval (AQuadrado (a)) = eval (a) * eval (a)
 | eval (ARetangulo (a1, a2)) = eval (a1) * eval (a2)
 | eval (ACirculo (a)) = 3.14 * eval (a) * eval (a);

val e = ACirculo(RConst 2.0);

eval e;