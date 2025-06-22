%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"int"           { return INT; }
"if"            { return IF; }
"else"          { return ELSE; }
"print"         { return PRINT; }

"=="            { return EQ; }
"!="            { return NE; }
"<="            { return LE; }
">="            { return GE; }
"<"             { return LT; }
">"             { return GT; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULT; }
"/"             { return DIV; }

"="             { return ASSIGN; }
";"             { return SEMI; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }

[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.id = strdup(yytext); return ID; }

[ \t\r\n]+      ; // skip whitespace
.               { printf("Unknown character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
