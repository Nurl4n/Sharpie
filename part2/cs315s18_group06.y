/* cs315s18_group06.y */
%{
#include <stdio.h>
  %}
%token NEWLINE
%token SET BOOL INTEGER SETOFSETS
%token TYPESET TYPEINTEGER TYPEBOOL TYPEVOID
%token SEMIC
%token ISSETTO
%token EQUALS NEQUALS
%token IDENTIFIER
%token PRINT READINPUT
%token LP RP
%token IF WHILE
%token LCB RCB
%token SUBSETOF SUPERSETOF
%token SETUNION SETINTERSECTION SETDIFF
$token NOT
$token COMMENT
$token FUNCCALLER
$token MAIN
%%
program: MAIN LCB lines RCB NEWLINE { printf("Input Program Valid.\n"); }
lines: /* empty */
       | lines line
       | lines ifstmt NEWLINE
       | lines whilestmt NEWLINE
       | lines functiondef NEWLINE
       ;
line: COMMENT NEWLINE
      | NEWLINE
      | assignment SEMIC NEWLINE
      | declaration SEMIC NEWLINE
      | printstmt SEMIC NEWLINE
      | readstmt SEMIC NEWLINE
      | functioncall SEMIC NEWLINE
 ;
ifstmt: IF LP condstmt RP LCB lines RCB
;
whilestmt: WHILE LP condstmt RP LCB lines RCB
;
condstmt: NOT condstmt
         | BOOL
         | IDENTIFIER intcomparator IDENTIFIER
         | IDENTIFIER intcomparator BOOL
         | IDENTIFIER intcomparator INTEGER
         | INTEGER intcomparator INTEGER
         | INTEGER intcomparator IDENTIFIER
         | IDENTIFIER setcomparator IDENTIFIER
         | IDENTIFIER setcomparator SET
         | SET setcomparator SET
         | SET setcomparator IDENTIFIER
;
intcomparator: EQUALS
         | NEQUALS
;
setcomparator: SUBSETOF
         | SUPERSETOF
;
setop: SETUNION
         | SETINTERSECTION
         | SETDIFF
         ;
declaration: TYPESET IDENTIFIER
      | TYPEBOOL IDENTIFIER
      | TYPEBOOL IDENTIFIER ISSETTO condstmt
      | TYPEINTEGER IDENTIFIER
       | TYPEINTEGER IDENTIFIER ISSETTO INTEGER
      | TYPESET IDENTIFIER ISSETTO IDENTIFIER
      | TYPEBOOL IDENTIFIER ISSETTO IDENTIFIER
      | TYPEINTEGER IDENTIFIER ISSETTO IDENTIFIER
      | TYPESET IDENTIFIER ISSETTO IDENTIFIER setop IDENTIFIER
      | TYPESET IDENTIFIER ISSETTO setcombination
      ;
assignment: IDENTIFIER ISSETTO INTEGER
      | IDENTIFIER ISSETTO condstmt
      | IDENTIFIER ISSETTO setcombination
      | IDENTIFIER ISSETTO IDENTIFIER
      ;
setcombination: SET
     	|setcombination setop SET
;
printstmt: PRINT LP SET RP
      | PRINT LP INTEGER RP
      | PRINT LP BOOL RP
      | PRINT LP IDENTIFIER RP
;
readstmt: READINPUT LP IDENTIFIER RP
;
functiondef: TYPEVOID IDENTIFIER LP parameterlist RP LCB lines RCB
      | TYPEINTEGER IDENTIFIER LP parameterlist RP LCB lines RCB
      | TYPEBOOL IDENTIFIER LP parameterlist RP LCB lines RCB
      | TYPESET IDENTIFIER LP parameterlist RP LCB lines RCB
;
type: TYPEINTEGER
      | TYPESET
      | TYPEBOOL
      ;
parameterlist: /* empty */
      | type IDENTIFIER
      | parameterlist ',' type IDENTIFIER
      ;
functioncall: FUNCCALLER IDENTIFIER LP parameters RP
;
parameter: IDENTIFIER
      | INTEGER
      | BOOL
      | SET
      ;
parameters: /* empty */
      | parameters parameter
      ;
%%
#include "lex.yy.c"
yyerror(char *s) { printf("[line: %d] Ay zibiiiil %s \n", lineno, s); }
main() {
  return yyparse();
}
