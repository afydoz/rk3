%Start A B C D E F
%{
	#include <stdio.h>
	char* mas[]={"Correct", "Incorrect" , "No"}; 
%}
%%
     BEGIN B;
<A>0 BEGIN B;
<A>1 BEGIN C;
<B>0 BEGIN A;
<B>1 BEGIN D;
<C>0 BEGIN D;
<C>1 BEGIN E;
<D>0 BEGIN C;
<D>1 BEGIN F;
<E>0 BEGIN F;
<E>1 BEGIN A;
<F>0 BEGIN E;
<F>1 BEGIN B;

[A-z2-9]+\n {printf("Error!!!\n"); return 2;}
<A>\n {printf("Success!\n"); return 0;}
<B>\n {printf("Error in B!\n"); return 1;}
<C>\n {printf("Error in C!\n"); return 1;}
<D>\n {printf("Error in D!\n"); return 1;}
<E>\n {printf("Error in E!\n"); return 1;}
<F>\n {printf("Error in F!\n"); return 1;}

%%

int main()
{
	int ret=yylex();
	printf("%s bin set.\n", mas[ret]);
	return(ret);
}

