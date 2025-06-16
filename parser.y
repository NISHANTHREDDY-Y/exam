%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
int yylex(void);
void yyerror(const char *s) { printf("❌ Syntax Error\n"); }
char buf[1000];
%}

%token ID NUM PLUS TIMES LPAREN RPAREN

%%
program : expr { printf("✅ Valid expression!\n"); } ;
expr : term exprp ;
exprp : PLUS term exprp | ;
term : factor termp ;
termp : TIMES factor termp | ;
factor : LPAREN expr RPAREN | ID | NUM ;
%%

int yylex() {
int c;
while ((c = getchar()) == ' ' || c == '\t');
if (c == '\n' || c == EOF) return 0;
if (isdigit(c)) return NUM;
if (isalpha(c)) return ID;
if (c == '+') return PLUS;
if (c == '*') return TIMES;
if (c == '(') return LPAREN;
if (c == ')') return RPAREN;
return c;
}

int main() {
printf("Enter expression: ");
if (fgets(buf, sizeof(buf), stdin)) {
for (int i = strlen(buf) - 1; i >= 0; i--) {
ungetc(buf[i], stdin);
}
yyparse();
}
return 0;
}

