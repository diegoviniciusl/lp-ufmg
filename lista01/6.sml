fun greet (name: string) = 
let
  val greeting = "Hello "
in
  if name <> "" then greeting ^ name else greeting ^ "nobody"
end;

greet("Janis");