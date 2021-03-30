/* cs315s18_group06.l */
%{
#include <stdio.h>
#include <stdlib.h>
int lineno = 1;
%}
main              main
integer                 [0-9]+
identifier      [a-zA-Z][a-zA-Z0-9]*
comment         \/\/[a-zA-Z0-9_.,$@!?>=<' |:]*
endofstatement  \;
set             \[((\ )*[a-zA-Z0-9]*(\ )*)(,(\ )*[a-zA-Z0-9]*)*(\ )*\]
setofsets       \[(\ )*{set}(\ )*(,(\ )*{set}(\ )*)*\]
lcb                     \{
rcb                     \}
lp                      \(
rp                      \)
subsetof                \<<
superof                 \>>
union                   \&
intersection            \^
setdiff                 \~
setvalueto              \=
equals          \==
nequals         \!\=
not             \!
funccaller        do
boolean         true|false
print                   yaz
read                    oxu
typeint                 int
typeset                 set
typevoid                void
typebool             boolean
nl                      \n
space                   ([ \t])*
if              if
while                   while
%%
{nl}                    {lineno++;
                         return(NEWLINE);
                        }
{main}                  return(MAIN);
{comment}               return(COMMENT);
{if}                    return(IF);
{while}                 return(WHILE);
{lp}                    return(LP);
{rp}                    return(RP);
{set}                   return(SET);
{lcb}                   return(LCB);
{rcb}                   return(RCB);
{setofsets}             return(SETOFSETS);
{integer}               return(INTEGER);
{boolean}               return(BOOL);
{endofstatement}        return(SEMIC);
{subsetof}              return(SUBSETOF);
{superof}               return(SUPERSETOF);
{union}         return(SETUNION);
{intersection}  return(SETINTERSECTION);
{setdiff}    return(SETDIFF);
{setvalueto}            return(ISSETTO);
{equals}                return(EQUALS);
{nequals}               return(NEQUALS);
{not}                   return(NOT);
{funccaller}            return(FUNCCALLER);
{print}                 return(PRINT);
{read}                  return(READINPUT);
{typeint}               return(TYPEINTEGER);
{typeset}               return(TYPESET);
{typebool}              return(TYPEBOOL);
{typevoid}              return(TYPEVOID);
{identifier}            return(IDENTIFIER);
{space}               ;
%%
int yywrap() { return 1;
 }
