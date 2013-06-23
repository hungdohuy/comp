/* Parser specification   */
/* Your name: DO Huy Hung */
/* Your id: PUFMINF1204   */  

%{

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
%token ADD SUB MUL INT_DIV FLOAT_DIV ASSIGN ASSIGN_CONST
%token LESS LESS_EQUAL NEQUAL LOGIC_NOT CONCAT MOD EQUAL GREATER GREATER_EQUAL LOGIC_AND LOGIC_OR

%nonassoc LESS GREATER LESS_EQUAL GREATER_EQUAL
%nonassoc EQUAL NEQUAL

%left LOGIC_AND LOGIC_OR
%left ADD SUB
%left MUL FLOAT_DIV INT_DIV MOD
%left CONCAT

%nonassoc LOGIC_NOT
%nonassoc UNARY
%nonassoc LSQBRA RSQBRA

%left DOT

%nonassoc NEW




/* Start symbol S's declaration (which symbol of the start symbol) */
%start program /*the entry point*/
%type <unit> program 

%%

/* Rule definitions */

program:
	many_declarations	EOF	{}
;

many_declarations:
	declaration	{}
	|declaration many_declarations	{}
;

declaration:
	one_class_decl	{}
	|one_method_decl	{}
;

one_class_decl:
	CLASS ID LCURBRA list_members_decl RCURBRA {}
	|CLASS ID EXTENDS ID LCURBRA list_members_decl RCURBRA {}
;

one_method_decl:
	return_type ID DOUBLECOLON ID LPAREN list_params RPAREN LCURBRA body RCURBRA	{}
	|ID DOUBLECOLON ID LPAREN list_params RPAREN LCURBRA body RCURBRA	{}
;

list_members_decl:
	{}
	|member_decl list_members_decl	{}
;

list_params:
	{}
	|combine_var_decl	{}
	|combine_var_decl SEMICOLON another_param	{}
;

body:
	{}
	|list_attributes_decl	{}
	|list_statements	{}
	|list_attributes_decl list_statements	{}
;
member_decl:
	|attribute_decl	{}
	|method_prototype	{}
;

combine_var_decl:
	list_id COLON value_type	{}
;

another_param:
	combine_var_decl {}
	|combine_var_decl SEMICOLON another_param	{}
;

list_attributes_decl:
	attribute_decl	{}
	|attribute_decl list_attributes_decl	{}
;

list_statements:
	statement	{}
	|statement list_statements	{}
;

attribute_decl:
	variables_decl	{}
	|constants_decl	{}
;

method_prototype:
	one_method	{}
	|constructor	{}
;

statement:
	NEW	{}
;

variables_decl:
	list_id COLON value_type SEMICOLON	{}
;

constants_decl:
	ID ASSIGN_CONST expr SEMICOLON	{}
;

list_id:
	ID	{}
	|ID	COMMA list_id	{}
;

one_method:
	return_type ID LPAREN list_params RPAREN SEMICOLON	{}
;

constructor:
	ID LPAREN list_params RPAREN SEMICOLON	{}
;


expr:
	ID	{}
	|INT_LIT	{}
	|FLOAT_LIT	{}
	|STRING_LIT	{}
	|BOOL_LIT	{}
;


return_type:
	value_type	{}
	|VOID	{}
;

value_type:
	element_type	{}
	|array	{}
;

array:
	element_type LSQBRA INT_LIT RSQBRA	{}
;

element_type:	
	primitive	{}
	|classtype	{}
;

primitive:
	INTEGER	{}
	|FLOAT	{}
	|STRING	{}
	|BOOL	{}
;

classtype:
	ID	{}
;




