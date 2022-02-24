(*Environment tests*)

use "Plc.sml";

exception TestFailed;

let
  val result = teval(fromString "x") [];
in
  print("\nFAIL. SymbolNotFound was not raised\n");
  raise TestFailed
end handle SymbolNotFound => 0;