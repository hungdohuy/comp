open Ast;;


exception Type_Mismatch_In_Expression of exp;;
exception Type_Mismatch_In_Statement of stmt;;
exception Undeclared_Identifier of string;;
exception Undeclared_Class of string;;
exception Undeclared_Method of string;;
exception Undeclared_Attribute of string;;
exception Redeclared_Variable of string;;
exception Redeclared_Method of string;;
exception Redeclared_Class of string;;
exception Redeclared_Parameter of string;;
exception Redeclared_Constant of string;;
exception Redeclared_Attribute of string;;
exception No_Prototype of string;;
exception No_Implementation of string;;