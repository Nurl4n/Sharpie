%option main
integer 		[0-9]+
double		[+-]?[0-9]*(\.)?[0-9]+
letter 		[a-zA-Z]
identifier 	[a-zA-Z][a-zA-Z0-9]*
string          #[a-zA-Z0-9_.,$@!?>=< |:]*#
comment         \/\/[a-zA-Z0-9_.,$@!?>=< |:]*
endofstatement	\;
set             \[[a-zA-Z][a-zA-Z0-9]*(\,\ [a-zA-Z][a-zA-Z0-9]*)*\]
lcb			\{
rcb			\}
lp			\(
rp			\)
union			\&
intersection	\^
complement		\~
subsetof		\<\<
superof		\>\>
setvalueto		\=
equals     	\==
nequals		\!\=
boolean		true|false
print			yaz
read			oxu
type 			int|boolean|double|set|string
while       	while
typeint     	int
typedouble  	double
typeboolean 	boolean
typeset     	set
typestring	 	string
typevoid		void
if          	if
%%
\n			printf("\n");
{comment}		printf(" A COMMENT ");
{if} 			printf(" IF ");
{lp} 			printf(" LP ");
{rp} 			printf(" RP ");
{lcb}			printf(" LCB ");
{rcb}			printf(" RCB ");
{set}			printf(" SET ");
{integer} 		printf(" INTEGER ");
{while} 		printf(" WHILE ");
{double} 		printf(" DOUBLE ");
{string}		printf(" STRING ");
{union}		printf(" UNION WITH ");
{intersection}	printf(" INTERSECTION WITH ");
{complement}	printf(" COMPLEMENT WRT ");
{endofstatement} printf(" SEMIC ");
{subsetof}		printf(" SUBSET OF ");
{superof}		printf(" SUPERSET OF ");
{setvalueto}	printf(" IS SET TO ");
{equals}       	printf(" EQUALS ");
{nequals}       	printf(" NEQUALS ");
{print}		printf(" PRINT ");
{read}		printf(" READ INPUT ");
{typeint}		printf(" TYPE INTEGER ");
{typedouble}	printf(" TYPE DOUBLE ");
{typeset}		printf(" TYPE SET ");
{typestring}	printf(" TYPE STRING ");
{typeboolean}	printf(" TYPE BOOLEAN ");
{typevoid}		printf(" TYPE VOID ");
{identifier}    printf(" IDENTIFIER ");