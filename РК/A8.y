%{
#include <stdio.h>
char* mas[]={"Correct", "Incorrect"};
int yylex();
int yyerror(char *);
%}
%%
s: B '\n' {printf("Возврат 0!\n"); return 0;}
A: |'0'E {printf("a\n");}
   |'1'B {printf("b\n");}
B: '0'F {printf("c\n");}
   |'1'A {printf("d\n");}
C: '0'A {printf("e\n");}
   |'1'D {printf("f\n");}
D: '0'B {printf("g\n");}
   |'1'C {printf("i\n");}
E: '0'C {printf("h\n");}
   |'1'F {printf("j\n");}
F: '0'D {printf("k\n");}
   |'1'E {printf("l\n");}
%%
int yylex(){
return (getchar());}
int yyerror(char* s){
return 1;}
int main(int argc, char* argv[]){
int ret=yyparse();
    printf("%s Bin set\n",mas[ret]);
return (ret);
}
