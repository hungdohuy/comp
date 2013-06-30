/* Parser specification   */
/* Your name: DO Huy Hung */
/* Your id: PUFMINF1204   */  

%{
open Ast;;

%}

/* token declarations */

%token EOF
%token <string> ID
%token LPAREN RPAREN LSQBRA RSQBRA LCURBRA RCURBRA COLON SEMICOLON DOUBLECOLON DOT COMMA
%token INTEGER BOOL EXTENDS STRING FLOAT
%token <string> STRING_LIT
%token <float> FLOAT_LIT
%token <int> INT_LIT
%token <bool> BOOL_LIT 
%token BREAK THEN VOID CLASS FOR TO NULL CONTINUE IF UNTIL SELF DO WHILE DOWNTO NEW RETURN ELSE REPEAT
%token ADD SUB MUL INT_DIV FLOAT_DIV MOD ASSIGN ASSIGN_CONST
%token LESS LESS_EQUAL NEQUAL LOGIC_NOT CONCAT  EQUAL GREATER GREATER_EQUAL LOGIC_AND LOGIC_OR

/*Lowest precedence*/
%nonassoc LESS GREATER LESS_EQUAL GREATER_EQUAL
%nonassoc EQUAL NEQUAL

%left LOGIC_AND LOGIC_OR
%left ADD SUB
%left MUL FLOAT_DIV INT_DIV MOD
%left CONCAT

%nonassoc IF_THEN
%nonassoc ELSE
%nonassoc LOGIC_NOT
%nonassoc UNARY
%nonassoc LSQBRA RSQBRA

%left DOT

%nonassoc NEW
/*Highest precedence*/

/* Start symbol S's declaration (which symbol of the start symbol) */
%start program /*the entry point*/
%type <Ast.programAST> program 

%%

/* Rule definitions */

program:
	many_declarations	EOF	{$1}
;

many_declarations:
	declaration	{[$1]}
	|declaration many_declarations	{$1::$2}
;

declaration:
	attribute_decl	{$1}
;

attribute_decl:
	variables_decl	{$1}
	|constants_decl	{$1}
;

variables_decl:
	list_id COLON value_type SEMICOLON	{VarDecl($1,$3)}
;

constants_decl:
	ID ASSIGN_CONST expr SEMICOLON	{ConstDecl($1,$3)}
;

list_id:
	ID	{$1}
	|ID	COMMA list_id	{$1}
;

return_type:
	value_type	{$1}
;

value_type:
	element_type	{$1}
;

element_type:	
	primitive	{$1}
;

primitive:
	INTEGER	{IntType}
	|FLOAT	{FloatType}
	|STRING	{StringType}
	|BOOL	{BoolType}
;

expr:
	ID			{Lhs(Id($1))}
	|INT_LIT	{Lit(IntVal($1))}
	|FLOAT_LIT	{Lit(FloatVal($1))}
	|STRING_LIT	{Lit(StringVal($1))}
	|SELF	{Self}
	|NULL	{Lit(Null)}
;