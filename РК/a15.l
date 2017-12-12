%option noyywrap
%START Q1 Q2

%%
<Q1>[ \n\t] {
    puts("CORRECT");
    BEGIN 0 ;
}

<Q1>[01] BEGIN Q2;

<Q2>[ \n\t] {
    puts("INCORRECT");
    BEGIN 0 ;
}
<Q2>[01] BEGIN Q1;

0	BEGIN Q2;
1	BEGIN Q2;
\n	puts("INCORRECT");

%%
int main()
{
    return(yylex());
}
