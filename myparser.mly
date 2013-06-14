/* Parser specification   */
/* Your name: DO Huy Hung */
/* Your id: PUFMINF1204   */  

%{

%}

/* token declarations */

%token CLASS ID LP RP SEMICOLON 
%token EOF




/* Start symbol S's declaration (which symbol of the start symbol) */
%start program /*the entry point*/
%type <unit> program 

%%

/* Rule definitions */

program:
	manyclassdeclaration EOF {  }
;

manyclassdeclaration: oneclassdecl {} 
;

oneclassdecl: CLASS ID LP RP {} 
;


