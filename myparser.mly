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
	many_class_decl	EOF	{}
;

many_class_decl:
	one_class_decl {}
	|one_class_decl many_class_decl	{}
;

one_class_decl:
	CLASS ID LCURBRA list_members_decl RCURBRA {}
;

list_members_decl:
	attributes_decl	{}
	|method_prototype	{}
	|attributes_decl list_members_decl	{}
	|method_prototype list_members_decl	{}
;

attributes_decl:
	many_variables_decl	{}
	|many_constant_decl	{}
;

method_prototype:
	common_type ID LPAREN list_params RPAREN SEMICOLON	{}
;

many_variables_decl:
	combine_var_decl SEMICOLON	{}
	|combine_var_decl SEMICOLON many_variables_decl	{}
;

many_constant_decl:
	one_constant_decl	{}
	|one_constant_decl many_constant_decl {}
;

one_constant_decl:
	ID ASSIGN_CONST expr SEMICOLON	{}
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
	list_id COLON common_type	{}
;

another_param:
	combine_var_decl {}
	|combine_var_decl SEMICOLON another_param	{}
;

list_id:
	ID	{}
	|ID	COMMA list_id	{}
;

array:
	common_type LSQBRA INT_LIT RSQBRA	{}
;

common_type:
	INTEGER	{}
	|FLOAT	{}
	|STRING	{}
	|BOOL	{}
	|ID	{}
	|VOID	{}
	|array	{}
;

