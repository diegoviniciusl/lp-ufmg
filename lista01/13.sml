fun sum (x: int, y: int) = x + y;
fun square (x: int) = x * x;
fun compose (f, g, x: int, y: int) = f(g(x, y));
fun squareOfTheSum (x: int, y: int) = compose(square, sum, x, y);

squareOfTheSum(4, 5);