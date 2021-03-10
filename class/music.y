%{
#include <stdio.h>
%}
%%
S     :  '(' S ')'
       |  '[' S ']'
       |   /* empty */    ;
%%
main(){
	return yyparse();
}
yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

