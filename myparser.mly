/* Parser specification   */
/* Your name: DO Huy Hung */
/* Your id: PUFMINF1204   */  

%{
open Ast;;
let rec combine listid vtype = 
	match listid with
	|[]-> []
	|head::tail	-> VarDecl(head,vtype)::(combine tail vtype)
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
	declaration						{$1}
	|declaration many_declarations	{$1 @ $2}
;

declaration:
	attribute_decl		{$1}
	|one_class_decl		{[$1]}
	|one_method_decl	{[$1]}
;

one_class_decl:
	CLASS ID LCURBRA list_members_decl RCURBRA 				{ClassDecl($2,"",$4)}
	|CLASS ID EXTENDS ID LCURBRA list_members_decl RCURBRA	{ClassDecl($2,$4,$6)}
;

one_method_decl:
	return_type ID DOUBLECOLON ID LPAREN list_params RPAREN LCURBRA body RCURBRA	{MethodDecl($1,$2,$4,$6,$9)}
	|ID DOUBLECOLON ID LPAREN list_params RPAREN LCURBRA body RCURBRA				{MethodDecl(ClassType($1),$1,$3,$5,$8)}
;

method_prototype:
	one_method		{$1}
	|constructor	{$1}
;

list_members_decl:
	{[]}
	|member_decl list_members_decl	{$1 @ $2}
;

one_method:
	return_type ID LPAREN list_params RPAREN SEMICOLON	{MethodProDecl($1,$2,$4)}
;

constructor:
	ID LPAREN list_params RPAREN SEMICOLON	{ConstructorDecl($1,$3)}
;

member_decl:
	attribute_decl		{$1}
	|method_prototype	{[$1]}
;

list_params:
	{[]}
	|combine_var_decl	{$1}
	|combine_var_decl SEMICOLON another_param	{$1 @ $3}
;

combine_var_decl:
	list_id COLON value_type	{combine $1 $3}
;

another_param:
	combine_var_decl {$1}
	|combine_var_decl SEMICOLON another_param	{$1 @ $3}
;

attribute_decl:
	variables_decl	{$1}
	|constants_decl	{[$1]}
;

variables_decl:
	list_id COLON value_type SEMICOLON	{combine $1 $3}
;

constants_decl:
	ID ASSIGN_CONST expr SEMICOLON	{ConstDecl($1,$3)}
;

list_id:
	ID					{[$1]}
	|ID	COMMA list_id	{$1::$3}
;

body:
	{[],[]}
	|list_attributes_decl list_statements	{$1,$2}
	|list_attributes_decl 					{$1,[]}
	|list_statements						{[],$1}
	
;

list_attributes_decl:
	attribute_decl	{$1}
	|list_attributes_decl attribute_decl 	{$1 @ $2}
;

return_type:
	value_type	{$1}
	|VOID		{VoidType}
;

value_type:
	element_type	{$1}
	|array			{$1}
;

array:
	element_type LSQBRA INT_LIT RSQBRA	{ArrayType($1,$3)}
;

element_type:	
	primitive	{$1}
	|classtype	{$1}
;

primitive:
	INTEGER	{IntType}
	|FLOAT	{FloatType}
	|STRING	{StringType}
	|BOOL	{BoolType}
;

classtype:
	ID	{ClassType($1)}
;

list_expr:
	expr					{[$1]}
	|expr COMMA list_expr	{$1::$3}
;

expr:
	ID							{Lhs(Id($1))}
	|INT_LIT					{Lit(IntVal($1))}
	|FLOAT_LIT					{Lit(FloatVal($1))}
	|STRING_LIT					{Lit(StringVal($1))}
	|BOOL_LIT					{Lit(BoolVal($1))}
	|SELF						{Self}
	|NULL						{Lit(Null)}
	|LPAREN expr RPAREN			{$2}
	|arithmetic_expr			{$1}
	|boolean_expr				{$1}
	|relational_expr			{$1}
	|expr CONCAT expr			{Binary(Concat,$1,$3)}	/*String expression*/
	|expr LSQBRA expr RSQBRA	{Lhs(Member($1,$3))}	/*Index expression*/
	|member_access				{$1}
	|object_creation			{$1}

;

arithmetic_expr:
	ADD expr %prec UNARY	{Unary(UPlus,$2)}
	|SUB expr %prec UNARY	{Unary(UMinus,$2)}
	|expr ADD expr			{Binary(Plus,$1,$3)}
	|expr SUB expr			{Binary(Minus,$1,$3)}
	|expr MUL expr			{Binary(Mul,$1,$3)}
	|expr INT_DIV expr		{Binary(IDiv,$1,$3)}
	|expr FLOAT_DIV expr	{Binary(Div,$1,$3)}
	|expr MOD expr			{Binary(Mod,$1,$3)}
;

boolean_expr:
	expr LOGIC_AND expr		{Binary(And,$1,$3)}
	|expr LOGIC_OR	expr	{Binary(Or,$1,$3)}
	|LOGIC_NOT expr			{Unary(NotOp,$2)}
;

relational_expr:
	expr EQUAL expr				{Binary(Eq,$1,$3)}
	|expr NEQUAL expr			{Binary(Neq,$1,$3)}
	|expr GREATER expr			{Binary(Gt,$1,$3)}
	|expr LESS expr				{Binary(Lt,$1,$3)}
	|expr GREATER_EQUAL expr	{Binary(Ge,$1,$3)}
	|expr LESS_EQUAL expr		{Binary(Le,$1,$3)}
;

member_access:
	expr DOT ID								{Lhs(Field($1,$3))}
	|expr DOT ID LPAREN RPAREN				{CallExp($1,$3,[])}
	|expr DOT ID LPAREN	list_expr RPAREN	{CallExp($1,$3,$5)}
;

object_creation:
	NEW ID LPAREN RPAREN			{New($2,[])}
	|NEW ID LPAREN list_expr RPAREN	{New($2,$4)}
;

list_statements:
	statement					{[$1]}
	|list_statements statement 	{$1 @ [$2]}
;

statement:
	block_stmt										{$1}
	|assignment_stmt								{$1}
	|if_stmt										{$1}
	|WHILE expr DO statement						{While($2,$4)}
	|REPEAT list_statements UNTIL expr SEMICOLON	{Repeat($2,$4)}
	|for_stmt										{$1}
	|BREAK SEMICOLON								{Break}
	|CONTINUE SEMICOLON 							{Continue}
	|RETURN expr SEMICOLON							{Return($2)}
	|method_invocation_stmt							{$1}
;

block_stmt:
	LCURBRA RCURBRA											{Block([],[])}
	|LCURBRA list_attributes_decl list_statements RCURBRA	{Block($2,$3)}
	|LCURBRA list_attributes_decl RCURBRA 					{Block($2,[])}
	|LCURBRA list_statements RCURBRA						{Block([],$2)}
;

assignment_stmt:
	lhs ASSIGN expr SEMICOLON	{Assign($1,$3)}
;

lhs:
	ID 							{Id($1)}
	|expr DOT ID 				{Field($1,$3)}
	|expr LSQBRA expr RSQBRA 	{Member($1,$3)} 
;

if_stmt:
	IF expr THEN statement ELSE statement	{IfThenElse($2,$4,$6)}	
	|IF expr THEN statement %prec IF_THEN		{IfThen($2,$4)}
	
;

for_stmt:
	FOR ID ASSIGN expr TO expr DO statement			{For($2,$4,true,$6,$8)}
	|FOR ID ASSIGN expr DOWNTO expr DO statement	{For($2,$4,false,$6,$8)}
;

method_invocation_stmt:
	expr DOT ID LPAREN list_expr RPAREN SEMICOLON	{Call($1,$3,$5)}
	|expr DOT ID LPAREN RPAREN SEMICOLON			{Call($1,$3,[])}
;