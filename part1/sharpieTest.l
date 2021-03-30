integer                 [0-9]+
typeint                 int
identifier      [a-zA-Z][a-zA-Z0-9]*
endofstatement  \;
set             \[((\ )*[a-zA-Z0-9]*(\ )*)(,(\ )*[a-zA-Z0-9]*)*(\ )*\]
setofsets       \[(\ )*{set}(\ )*(,(\ )*{set}(\ )*)*\]
lp                      \(
rp                      \)
setvalueto              \=
print                   yaz
typeset                 set
nl                      \n
space                   (\ )*
%%
{nl}                    return(NEWLINE);
{lp}                    return(LP);
{rp}                    return(RP);
{set}                   return(SET);
{setofsets}             return(SETOFSETS);
{integer}               return(INTEGER);
{endofstatement}        return(SEMIC);
{setvalueto}    return(ISSETTO);
{print}         return(PRINT);
{typeint}               return(TYPEINTEGER);
{typeset}               return(TYPESET);
{identifier}    return(IDENTIFIER);
{space}               ;
%%
int yywrap() { return 1;
 }
