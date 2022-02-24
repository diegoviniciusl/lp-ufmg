fun isSpecialCharacter (character: char) = 
Char.isSpace(character) orelse
Char.compare(character, #".") = EQUAL orelse
Char.compare(character, #",") = EQUAL orelse
Char.compare(character, #"-") = EQUAL;

fun split (phrase: string) = String.tokens isSpecialCharacter(phrase);

split("Bom dia,pra-você");
