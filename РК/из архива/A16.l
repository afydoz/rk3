%Start OPEN
REG [1-9][0-9]*
%{
int ch;
%}
%%
<OPEN>{REG}		{	if(yylval>=ch)
					ECHO;
				else BEGIN 0;
			}
{REG}			{	ch=yylval;
				BEGIN OPEN;
			}	
[^ \t\n]+ ;
.|\n ;
