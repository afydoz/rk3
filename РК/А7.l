%Start A B C D E F
%option noyywrap 
%option main
%{
 #include <stdio.h>
 char* mas[]={"Correct", "Incorrect"}; 
%}
%%
 BEGIN A;
<A>1 BEGIN E;
<A>0 BEGIN B;
<B>1 BEGIN F;
<B>0 BEGIN A;
<C>1 BEGIN A;
<C>0 BEGIN D;
<D>1 BEGIN B;
<D>0 BEGIN C;
<E>1 BEGIN C;
<E>0 BEGIN F;
<F>1 BEGIN D;
<F>0 BEGIN E;

<A>\n {printf("Success!\n");BEGIN A;}
<B>\n {printf("Error in B\n");return 1;}
<C>\n {printf("Error in C\n");return 1;}
<D>\n {printf("Error in D\n");return 1;}
<E>\n {printf("Error in E\n");return 1;}
<F>\n {printf("Error in F\n");return 1;}
.|\n  {printf("Error\n");return 1;}


