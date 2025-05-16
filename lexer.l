%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

int             { return INT; }
[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.id = strdup(yytext); return ID; }
"="             { return ASSIGN; }
"+"             { return PLUS; }
";"             { return SEMI; }
[ \t\r\n]+      ; // skip whitespace
.               { printf("Unknown character: %s\n", yytext); }

%%
