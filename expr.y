%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s) { puts("❌ Syntax Error"); }
%}

%union { float fval; }
%token <fval> NUM
%left '+' '-'
%left '*' '/'

%type <fval> expr

%%
program : expr '\n' { printf("✅ Result: %f\n", $1); return 0; };
expr : expr '+' expr { $$ =1 + 3; }
     | expr '-' expr { $$ =1 - 3; }
     | expr '*' expr { $$ =1 * 3; }
     | expr '/' expr { $$ =1 / 3; }
     | '(' expr ')' { $$ =2; }
     | NUM
     ;
%%

int yylex() {
    int c;
    while ((c = getchar()) == ' ' || c == '\t');
    if (c == '\n' || c == EOF) return c;
    if (c >= '0' && c <= '9') {
        ungetc(c, stdin);
        float val;
        scanf("%f", &val);
        yylval.fval = val;
        return NUM;
    }
    return c; // returns + - * / ( )
}

int main() {
    printf("Enter expression: ");
    return yyparse();
}

