(* Plc Lexer *)

(* User declarations *)

open Tokens
type pos = int
type slvalue = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult = (slvalue, pos)token

(* A function to print a message error on the screen. *)
val error = fn x => TextIO.output(TextIO.stdOut, x ^ "\n")
val lineNumber = ref 0

(* Get the current line being read. *)
fun getLineAsString() =
    let
        val lineNum = !lineNumber
    in
        Int.toString lineNum
    end

fun toInt s =
    case Int.fromString s of
    SOME i => i
    |  NONE => raise Fail ("Failed convertion")

fun keyWord (s, a, b) = 
    case s of "var" => VAR(a, b)
    | "fn" => FN(a, b)
    | "if" => IF(a, b)
    | "then" => THEN(a, b)
    | "else" => ELSE(a, b)
    | "match" => MATCH(a, b)
    | "with" => WITH(a, b)
    | "hd" => HD(a, b)
    | "tl" => TL(a, b)
    | "print" => PRINT(a, b)
    | "end" => END(a, b)
    | "ise" => ISE(a, b)
    | "Nil" => NIL(a, b)
    | "Bool" => BOOL(a, b)
    | "Int" => INT(a, b)
    | "true" => TRUE(a, b)
    | "false" => FALSE(a, b)
    | "fun" => FUN(a, b)
    | "rec" => REC(a, b)
    | "_" => USCORE(a, b)
    | _ => NAME(s, a, b)

(* Define what to do when the end of the file is reached. *)
fun eof () = Tokens.EOF(0,0)

(* Initialize the lexer. *)
fun init() = ()

%%
%header (functor PlcLexerFun(structure Tokens: PlcParser_TOKENS));
alpha=[A-Za-z];
digit=[0-9];
whitespace=[\ \t];
identifier=[a-zA-Z_][a-zA-Z_0-9]*;

%s COMMENTARY;
%%

\n => (lineNumber := !lineNumber + 1; lex());
<INITIAL>{whitespace}+ => (lex());
<INITIAL>{digit}+ => (CINT(toInt(yytext), yypos, yypos));
<INITIAL>{identifier} => (keyWord(yytext, yypos, yypos));
<INITIAL>"|" => (PIPE(yypos, yypos));
<INITIAL>"!" => (NEGATIVE(yypos, yypos));
<INITIAL>"&&" => (AND(yypos, yypos));
<INITIAL>"::" => (DOUBLECOLON(yypos, yypos));
<INITIAL>":" => (COLON(yypos, yypos));
<INITIAL>";" => (SEMICOLON(yypos, yypos));
<INITIAL>"," => (COMMA(yypos, yypos));
<INITIAL>"+" => (PLUS(yypos, yypos));
<INITIAL>"-" => (MINUS(yypos, yypos));
<INITIAL>"*" => (MULTIPLIER(yypos, yypos));
<INITIAL>"/" => (DIVIDER(yypos, yypos));
<INITIAL>"=" => (EQUAL(yypos, yypos));
<INITIAL>"!=" => (DIFFERENT(yypos, yypos));
<INITIAL>"<" => (LESS(yypos, yypos));
<INITIAL>"<=" => (LESSEQ(yypos, yypos));
<INITIAL>"->" => (ARROW(yypos, yypos));
<INITIAL>"=>" => (DOUBLEARROW(yypos, yypos));
<INITIAL>"(" => (OPENPAREN(yypos, yypos));
<INITIAL>")" => (CLOSEPAREN(yypos, yypos));
<INITIAL>"[" => (OPENBRACK(yypos, yypos));
<INITIAL>"]" => (CLOSEBRACK(yypos, yypos));
<INITIAL>"{" => (OPENCBRACK(yypos, yypos));
<INITIAL>"}" => (CLOSECBRACK(yypos, yypos));
<INITIAL>"(*" => (YYBEGIN COMMENTARY; lex());
<COMMENTARY>"*)" => (YYBEGIN INITIAL; lex());
<COMMENTARY>. => (lex());
<INITIAL>. => (error("Could not find character");
raise Fail("Could not find character"));