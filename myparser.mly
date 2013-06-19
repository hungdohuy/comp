/* Parser specification   */
/* Your name: DO Huy Hung */
/* Your id: PUFMINF1204   */  

%{

%}

/* token declarations */

%token EOF
%token <string> ID
%token LPAREN
%token RPAREN
%token LSQBRA
%token RSQBRA
%token LCURBRA
%token RCURBRA
%token COLON
%token SEMICOLON
%token DOUBLECOLON
%token DOT
%token COMMA
%token INTEGER
%token BOOL
%token EXTENDS
%token STRING
%token BREAK
%token FLOAT
%token <string> STRING_LIT
%token <float> FLOAT_LIT
%token <int> INT_LIT
%token <bool> BOOL_LIT 
%token THEN
%token VOID
%token CLASS
%token FOR
%token TO
%token NULL
%token CONTINUE
%token IF
%token UNTIL
%token SELF
%token DO
%token WHILE
%token DOWNTO
%token NEW
%token RETURN
%token ELSE
%token REPEAT
%token ADD
%token MUL
%token INT_DIV
%token ASSIGN
%token LESS
%token LESS_EQUAL
%token NEQUAL
%token LOGIC_NOT
%token CONCAT
%token SUB
%token FLOAT_DIV
%token MOD
%token EQUAL
%token GREATER
%token GREATER_EQUAL
%token LOGIC_AND
%token LOGIC_OR




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
;

method_prototype:
	return_type ID LPAREN list_params RPAREN SEMICOLON	{}
;

many_variables_decl:
	combine_var_decl SEMICOLON	{}
	|combine_var_decl SEMICOLON many_variables_decl	{}
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
	common_type	{}
	|array	{}
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
;




