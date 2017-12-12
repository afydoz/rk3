%Start A B C D E F
%{
 #include <stdio.h>
 #include "A08.tab.h"
 char* mes[]={"Correct", "Incorrect"}; 
%}
%%
 BEGIN A;
<A>0 {printf("a\n"); BEGIN E;}
<A>1 {printf("b\n"); BEGIN B;}
<B>0 {printf("c\n"); BEGIN F;}
<B>1 {printf("d\n"); BEGIN A;}
<C>0 {printf("e\n"); BEGIN A;}
<C>1 {printf("f\n"); BEGIN D;}
<D>0 {printf("g\n"); BEGIN B;}
<D>1 {printf("h\n"); BEGIN C;}
<E>0 {printf("i\n"); BEGIN C;}
<E>1 {printf("j\n"); BEGIN F;}
<F>0 {printf("k\n"); BEGIN D;}
<F>1 {printf("l\n"); BEGIN E;}

<B>\n {printf("Возврат 1c!\n");return 0;}
<A>\n {printf("Возврат 1RRR!\n");return 1;}
<C>\n {printf("Возврат 1RRR!\n");return 1;}
<D>\n {printf("Возврат 1RRR!\n");return 1;}
<E>\n {printf("Возврат 1RRR!\n");return 1;}
<F>\n {printf("Возврат 1RRR!\n");return 1;}
.|\n  {printf("Возвратddd 1d!\n");return 1;}
%%
int main(int argc, char* argv[]){
int ret=yylex();
printf("%s Bin Set\n", mes[ret]);
return (ret);
}

