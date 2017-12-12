%{
#include <stdio.h>
char* mas[]={"Correct","Incorrect"};
%}
%%
s:  A '\n' {printf("Success!\n"); return 0;}
;

A: |'0'E {printf("E\n");}
   |'1'B {printf("B\n");}
;
   
B: 	'0'F {printf("F\n");}
   |'1'A {printf("A\n");}
;
   
C: 	'0'A {printf("A\n");}
   |'1'D {printf("D\n");}
;

D: 	'0'B {printf("B\n");}
   |'1'C {printf("C\n");}
;

E: 	'0'C {printf("C\n");}
   |'1'F {printf("F\n");}
;

F: 	'0'D {printf("D\n");}
   |'1'E {printf("E\n");}
;

%%
int yylex()
{
	return (getchar());
}

int yyerror(char* s)
{
	return 1;
}

int main(int argc, char* argv[])
{
	int ret=yyparse();
    printf("%s Bin set\n",mas[ret]);
	return (ret);
}
