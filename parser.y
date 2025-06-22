%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
%token INT IF ELSE PRINT
%token ASSIGN PLUS MINUS MULT DIV SEMI
%token EQ NE GE LE GT LT

%type <num> expression condition

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%

program:
    program statement
  | statement
  ;

statement:
    INT ID ASSIGN expression SEMI {
        declare($2, $4);
        free($2);
    }
  | ID ASSIGN expression SEMI {
        assign($1, $3);
        free($1);
    }
  | PRINT ID SEMI {
        int val = get_value($2);
        printf(">> %s = %d\n", $2, val);
        free($2);
    }
  | IF '(' condition ')' '{' program '}' %prec LOWER_THAN_ELSE {
        if ($3) {
            // executed block above if condition is true
        }
    }
  | IF '(' condition ')' '{' program '}' ELSE '{' program '}' {
        if ($3) {
            // executed block above if condition is true
        } else {
            // else block executed
        }
    }
  ;

condition:
    expression LT expression { $$ = $1 < $3; }
  | expression GT expression { $$ = $1 > $3; }
  | expression EQ expression { $$ = $1 == $3; }
  | expression NE expression { $$ = $1 != $3; }
  | expression GE expression { $$ = $1 >= $3; }
  | expression LE expression { $$ = $1 <= $3; }
  ;

expression:
    expression PLUS expression  { $$ = $1 + $3; }
  | expression MINUS expression { $$ = $1 - $3; }
  | expression MULT expression  { $$ = $1 * $3; }
  | expression DIV expression {
        if ($3 == 0) {
            printf("Error: Division by zero\n");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
  | NUMBER { $$ = $1; }
  | ID     { $$ = get_value($1); free($1); }
  ;

%%

int main(void) {
    printf("Starting parsing...\n");
    yyparse();
    return 0;
}
