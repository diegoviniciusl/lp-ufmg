(* Plc interpreter main file *)
CM.make("$/basis.cm");
CM.make("$/ml-yacc-lib.cm");

use "Environ.sml";
use "Absyn.sml";
use "PlcParserAux.sml";
use "PlcParser.yacc.sig";
use "PlcParser.yacc.sml";
use "PlcLexer.lex.sml";
use "Parse.sml";
use "PlcInterp.sml";
use "PlcChecker.sml";

Control.Print.printLength := 1000;
Control.Print.printDepth := 1000;
Control.Print.stringDepth := 1000;

open PlcFrontEnd;

fun run exp =
  let
    val expressionType = teval exp []
    val result = eval exp []
  in
    val2string(result) ^ " : " ^ type2string(expressionType)
  end
    handle 
      (*Environ exceptions*)
      SymbolNotFound => "Could not find symbol"
      (*PlcInterp exceptions*)
      | Impossible => "This should be impossible"
      | HDEmptySeq => "Can not access empty head sequence"
      | TLEmptySeq => "Can not access empty tail sequence"
      | NotAFunc => "Not a function"
      | ValueNotFoundInMatch => "Value not found in match"
      (*PlcChecker exceptions*)
      | UnknownType => "Could not resolve type"
      | EmptySeq => "Can not resolve empty sequence"
      | DiffBrTypes => "Branches with different types"
      | WrongRetType => "Can not return different type"
      | IfCondNotBool => "Can not use non boolean expressions for ifs"
      | NoMatchResults => "Could not match results"
      | ListOutOfRange => "Can not access elements without of list range"
      | MatchCondTypesDiff => "Can not match with different condition types"
      | CallTypeMisM => "Can not call a function sending different parameter types"
      | NotFunc => "Can not call non functions as functions"
      | OpNonList => "Can not treat a non list as a list"
      | NotEqTypes => "Can not compare different types"
      | MatchResTypeDiff => "Can not match with different result types"
      | _ => "Could not find the correct match error"