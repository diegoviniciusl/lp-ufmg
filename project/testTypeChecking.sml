(*Type checking tests*)

use "Plc.sml";

exception TestFailed;

teval(If(Prim2("=", ConI 11, ConI 12), ConI 1, ConI 0))[];
teval(Let("b", Prim2("=", ConI 1, ConI 2), If(Var "b", ConI 3, ConI 4)))[];
teval(Letrec("f1", IntT, "x", IntT, Prim2("+", Var "x", ConI 1), Call(Var "f1", ConI 12)))[];

let
  val result = teval(Let("b", Prim2("=", ConI 1, ConI 2), If(Var "b", Var "b", ConI 6)))[];
in 
  print("\nFAIL. DiffBrTypes was not raised\n");
  raise TestFailed
end handle DiffBrTypes => 0;

let
  val result = teval(Let("f", Anon(BoolT, "x", If(Var "x", ConI 11, ConI 22)), Call(Var "f", ConI 0)))[];
in
  print("\nFAIL. CallTypeMisM was not raised\n");
  raise TestFailed
end handle CallTypeMisM => 0; 

let
  val result = teval(Letrec("f", BoolT, "x", BoolT, If(Var "x", ConI 11, ConI 22), Call(Var "f", ConB true)))[];
in
  print("\nFAIL. WrongRetType was not raised\n");
  raise TestFailed
end handle WrongRetType => 0;

let
  val result = teval(fromString "0 != false")[];
in
  print("\nFAIL. NotEqTypes was not raised\n");
  raise TestFailed
end handle NotEqTypes => 0;

let
  val result = teval(fromString "match true with end")[];
in
  print("\nFAIL. NoMatchResults was not raised\n");
  raise TestFailed
end handle NoMatchResults => 0;

let
  val result = teval(fromString "match typeDiff with | 1 -> 0 | _ -> false end")[("typeDiff", IntT)];
in
  print("\nFAIL. MatchResTypeDiff was not raised\n");
  raise TestFailed
end handle MatchResTypeDiff => 0;

let
  val result = teval(fromString "fun rec wrongTypeFunc():Int = false; wrongTypeFunc()")[];
in
  print("\nFAIL. WrongRetType was not raised\n");
  raise TestFailed
end handle WrongRetType => 0;

let
  val result = teval(fromString "fun diffTypeFunc(Bool diffType) = if diffType != true then 1 else false; diffTypeFunc(false)")[];
in
  print("\nFAIL. DiffBrTypes was not raised\n");
  raise TestFailed
end handle DiffBrTypes => 0;

let
  val result = teval(fromString "fun callTypeMFunc(Bool callTypeM) = if callTypeM != true then 0 else 1; callTypeMFunc(1)")[];
in
  print("\nFAIL. CallTypeMisM was not raised\n");
  raise TestFailed
end handle CallTypeMisM => 0;

let
  val result = teval(fromString "var opNonList = true; opNonList[1]")[];
in
  print("\nFAIL. OpNonList was not raised\n");
  raise TestFailed
end handle OpNonList => 0;

let
  val result = teval(fromString "var nonFunc = false; nonFunc(false)")[];
in
  print("\nFAIL. NotFunc was not raised\n");
  raise TestFailed
end handle NotFunc => 0;

let
  val result = teval(fromString "match matchCondV with | 0 -> false | 1 -> false end")[("matchCondV", BoolT)];
in
  print("\nFAIL. MatchCondTypesDiff was not raised\n");
  raise TestFailed
end handle MatchCondTypesDiff => 0;

let
  val result = teval(fromString "(1, 2)[3]")[];
in
  print("\nFAIL. ListOutOfRange was not raised\n");
  raise TestFailed
end handle ListOutOfRange => 0;

let
  val result = teval(fromString "(Bool [])")[];
in
  print("\nFAIL. EmptySeq was not raised\n");
  raise TestFailed
end handle EmptySeq => 0;

let
  val result = teval(fromString "if () then 1 else 0")[];
in
  print("\nFAIL. IfCondNotBool was not raised\n");
  raise TestFailed
end handle IfCondNotBool => 0;

let
  val result = teval(fromString "(1::2)")[("nothing", IntT)];
in
  print("\nFAIL. UnknownType was not raised\n");
  raise TestFailed
end handle UnknownType => 0;