%Start A B C D E F
%{
 #include <stdio.h>
 char* mas[]={"Correct", "Incorrect"}; 
%}
%%
 BEGIN A;
<A>0 BEGIN E;
<A>1 BEGIN B;
<B>0 BEGIN F;
<B>1 BEGIN A;
<C>0 BEGIN A;
<C>1 BEGIN D;
<D>0 BEGIN B;
<D>1 BEGIN C;
<E>0 BEGIN C;
<E>1 BEGIN F;
<F>0 BEGIN D;
<F>1 BEGIN E;

<A>\n {printf("Success!\n");return 0;}
<B>\n {printf("Error in B\n");return 1;}
<C>\n {printf("Error in C\n");return 1;}
<D>\n {printf("Error in D\n");return 1;}
<E>\n {printf("Error in E\n");return 1;}
<F>\n {printf("Error in F\n");return 1;}
.|\n  {printf("Error\n");return 1;}
%%
int main(int argc, char* argv[]){
int ret=yylex();
printf("%s Bin Set\n", mas[ret]);
return (ret);
}

