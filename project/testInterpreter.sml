(*Interpreter tests*)

use "Plc.sml";

exception TestFailed;

let
  val result = eval(fromString "hd ([Int] [])")[]
in
  print("\nFAIL. HDEmptySeq was not raised\n");
  raise TestFailed
end handle HDEmptySeq => 0;

let
  val result = eval(fromString "impossible = true")[("impossible", IntV 10)]
in
  print("\nFAIL. Impossible was not raised\n");
  raise TestFailed
end handle Impossible => 0;

let
  val result = eval(fromString "match notMatchingValue with | 1 -> 1 end")[("notMatchingValue", IntV 2)]
in
  print("\nFAIL. ValueNotFoundInMatch was not raised\n");
  raise TestFailed
end handle ValueNotFoundInMatch => 0;

let
  val result = eval(fromString "var notAFunc = 0; notAFunc(1)")[]
in
  print("\nFAIL. NotAFunc was not raised\n");
  raise TestFailed
end handle NotAFunc => 0;

let
  val result = eval(fromString "tl ([Int] [])")[]
in
  print("\nFAIL. TLEmptySeq was not raised\n");
  raise TestFailed
end handle TLEmptySeq => 0;