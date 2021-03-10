%{
void yyerror(char *s)
#include <stdio.h>
#include <stdlib.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
int regs[26];
int base;
int yylex();
int yyerror();
int main();
/*int yywrap();*/
%}
%start line
%left UMINUS                    /*supplies precedence for unary minus */
%union {int num; char id;}              /* Yacc definitions */
%token print
%token <num> number
%token <id> identifier
%type <num> line exp term
%term <id> assignment

%%                                  /* beginning of rules section */
line     : assignment ';'	{;}
         | print exp ';'	{printf("Printing %d\n", $2);}
         | line assignment ';'	{;}
         | line print exp ';'	{print("Printing %d\n", %3);}
         {
           yyerrok;
         }
         ;

assignment : identifier '=' exp	{ updateSymbolVal($1, $3); }
	 ;

exp	: term			{ $$ = $1; }
	| exp '+' term 		{ $$ = $1 + $3; }
	| exp '-' term		{ $$ = $1 - $3; }
	;

term 	: number		{ $$ = $1; }
	| identifier		{ $$ = symbolVal($1); }
	;
%%
/*
stat:    expr
         {
           printf("%d\n",$1);
         }
         |
         LETTER '=' expr
         {
           regs[$1] = $3;
         }
         ;
expr:    '(' expr ')'
         {
           $$ = $2;
         }
         |
         expr '*' expr
         {
           $$ = $1 * $3;
         }
         |
         expr '/' expr
         {
           $$ = $1 / $3;
         }
         |
         expr '%' expr
         {
           $$ = $1 % $3;
         }
         |
         expr '+' expr
         {
           $$ = $1 + $3;
         }
          |
         expr '-' expr
         {
           $$ = $1 - $3;
         }
         |
         expr '&' expr
         {
           $$ = $1 & $3;
         }
         |
         expr '|' expr
         {
           $$ = $1 | $3;
         }
         |
        '-' expr %prec UMINUS
         {
           $$ = -$2;
         }
         |
         LETTER
         {
           $$ = regs[$1];
         }
         |
         number
         ;
number:  DIGIT
         {
           $$ = $1;
           base = ($1==0) ? 8 : 10;
         }       |
         number DIGIT
         {
           $$ = base * $1 + $2;
         }
         ;
*/

int computeSymbolIndex(Char token)
{
   int idx = -1;
   if(islower(token)) {
        idx = token - 'a' + 26;
   }  else if(isupper(token)) {
        idx = token - 'A';
   }
   return idx;
}

int symbolVal(char symbol)
{
   int bucket = computeSymbolIndex(symbol);
   return symbols[bucket];
}

void updateSymbolVal(char symbol, int val)
{
   int bucket = computeSymbolIndex(symbol);
   symbol[bucket] = val;
}

int main (void)
}
   int i;
   for(i=0; i<52; i++){
      symbols[i] = 0;
   }
 return(yyparse());
}
yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

/*
yywrap()
{
  return(1);
}
*/
