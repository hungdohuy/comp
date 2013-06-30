type programAST = decl list
and decl = VarDecl of string * bkoolType 
| ConstDecl of string * exp 
| ClassDecl of string * string * decl list
| MethodDecl of bkoolType * string * string * decl list * body 
| MethodProDecl of bkoolType * string * decl list
| ConstructorDecl of string * decl list
and body =  decl list * stmt list
and bkoolType = IntType | FloatType | StringType | BoolType | VoidType 
| ArrayType of bkoolType * int 
| ClassType of string
and stmt = Assign of lhs * exp
| Block of decl list * stmt list
| IfThenElse of exp * stmt * stmt
| IfThen of exp * stmt
| While of exp * stmt
| Repeat of stmt list * exp
| For of string * exp * bool * exp * stmt
| Break
| Continue
| Return of exp
| Call of exp * string * exp list
and exp = Unary of unaryop * exp
| Binary of binaryop * exp * exp
| CallExp of exp * string * exp list
| New of string * exp list
| Lhs of lhs
| Self
| Lit of literal
and literal =
IntVal of int
| FloatVal of float
| StringVal of string
| BoolVal of bool
| Null
and lhs = 
| Id of string
| Member of exp * exp
| Field of exp * string
and unaryop = NotOp | UPlus | UMinus 
and binaryop = Plus | Minus | Mul | Div | IDiv | Mod 
| Ge | Gt | Le | Lt | Eq | Neq | And | Or | Concat 
