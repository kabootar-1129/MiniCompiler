%{
#include <stdio.h>
#include <stdlib.h>
#include "symbol_table.h"
#include "semantic.h"

int yylex();
void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}
%}

%union {
    int num;
    char *id;
}

%token <num> NUMBER
%token <id> ID
%token INT ASSIGN PLUS SEMI
%type <num> expression

%%

program:
    program statement
  | statement { printf("Compilation successful.\n"); }
  ;

statement:
    INT ID ASSIGN expression SEMI   { 
        printf("DEBUG: Declaring %s with value %d\n", $2, $4);
        declare($2, $4); 
        free($2); 
    }
  | ID ASSIGN expression SEMI       { 
        printf("DEBUG: Assigning %s with value %d\n", $1, $3);
        assign($1, $3); 
        free($1); 
    }
  ;

expression:
    expression PLUS expression       { $$ = $1 + $3; }
  | NUMBER                         { $$ = $1; }
  | ID                             { $$ = get_value($1); free($1); }
  ;

%%

int main(void) {
    printf("Starting parsing...\n");
    yyparse();
    return 0;
}
