%s EE EO OE OO

%%
 BEGIN EE;

<EE>0 BEGIN OE; yymore();
<EE>1 BEGIN EO; yymore();
<OE>0 BEGIN EE; yymore();
<OE>1 BEGIN OO; yymore();
<EO>0 BEGIN OO; yymore(); 
<EO>1 BEGIN EE; yymore();
<OO>0 BEGIN EO; yymore();
<OO>1 BEGIN OE; yymore();

<OO>[\n \t] BEGIN EE; ECHO;
[\n\t ] BEGIN EE;
. BEGIN 0;


