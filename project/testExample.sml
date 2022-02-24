(*Example tests*)

use "Plc.sml";

exception ExampleFailed;

val exampleResult = val2string(eval(fromFile("example.plc"))[]);

if exampleResult = "15" then 0 else raise ExampleFailed;
