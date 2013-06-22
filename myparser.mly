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




/* Start symbol S's declaration (which symbol of the start symbol) */
%start program /*the entry point*/
%type <unit> program 

%%

/* Rule definitions */

program:
	many_classes_decl	EOF	{}
;

many_classes_decl:
	one_class_decl {}
	|one_class_decl many_classes_decl	{}
;

one_class_decl:
	CLASS ID LCURBRA list_members_decl RCURBRA {}
;

list_members_decl:
	{}
	|member_decl list_members_decl	{}
;

member_decl:
	|attributes_decl	{}
	|methods_prototype	{}
;

attributes_decl:
	variables_decl	{}
	|constants_decl	{}
;

methods_prototype:
	one_method	{}
	|constructor	{}
;

variables_decl:
	list_id COLON value_type SEMICOLON	{}
;

constants_decl:
	ID ASSIGN_CONST expr SEMICOLON	{}
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
;

list_params:
	{}
	|combine_var_decl	{}
	|combine_var_decl SEMICOLON another_param	{}
;

combine_var_decl:
	list_id COLON value_type	{}
;

another_param:
	combine_var_decl {}
	|combine_var_decl SEMICOLON another_param	{}
;

list_id:
	ID	{}
	|ID	COMMA list_id	{}
;

return_type:
	value_type	{}
	|VOID	{}
;

value_type:
	classtype	{}
	|primitive	{}
	|array	{}
;

classtype:
	ID	{}
;

primitive:
	INTEGER	{}
	|FLOAT	{}
	|STRING	{}
	|BOOL	{}
;

array:
	element_type LSQBRA INT_LIT RSQBRA	{}
;

element_type:	
	primitive	{}
	|classtype	{}
;


