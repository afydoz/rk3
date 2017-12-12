%option noyywrap
%START Q1 Q2 Q3 Q4 Q5 Q6 ER
%%
<Q1>[ \n\t] {
    puts("Q1 CORRECT");
    BEGIN 0 ;
}
<Q1>[^01\ \n\t] BEGIN ER ;
<Q1>1 {printf("Q1_1\n"); BEGIN Q5;}
<Q1>0 {printf("Q1_0\n"); BEGIN Q1;}

<Q2>[ \n\t] {
    puts("Q2 INCORRECT");
    BEGIN 1 ;
}

<Q2>1 {printf("Q2_1\n"); BEGIN Q3;}
<Q2>0 {printf("Q2_0\n"); BEGIN Q1;}

<Q3>[ \n\t] {
    puts("Q3 INCORRECT");
    BEGIN 1 ;
}
<Q3>1 {printf("Q3_1\n"); BEGIN Q4;} 
<Q3>0 {printf("Q3_0\n"); BEGIN Q5;}

<Q4>[ \n\t] {
    puts("Q4 INCORRECT");
    BEGIN 1 ;
}
<Q4>1 {printf("Q4_1\n"); BEGIN Q1;}
<Q4>0 {printf("Q4_0\n"); BEGIN Q6;}

<Q5>[ \n\t] {
    puts("Q5 INCORRECT");
    BEGIN 1;
}
<Q5>1 {printf("Q5_1\n"); BEGIN Q6;}
<Q5>0 {printf("Q5_0\n"); BEGIN Q3;}

<Q6>[ \n\t] {
    puts("Q6 INCORRECT");
    BEGIN 1;
}
<Q6>1 {printf("Q6_1\n"); BEGIN Q1;}
<Q6>0 {printf("Q6_0\n"); BEGIN Q4;}

<ER>[^\ \t\n] BEGIN ER;

1	{printf("1_1\n"); BEGIN Q5;}
0	{printf("0_0\n"); BEGIN Q1;}
\n	puts("n INCORRECT");
.		;
%% 
int main()
{
 return(yylex());
}
