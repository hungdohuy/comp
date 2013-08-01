
--- Testing ---------

1 => Failed
  Undeclared Class: A
  TypeMismatch In Statement: b:=a
attr_const => Passed
attr_misc => Passed
attr_misc_2 => Passed
attr_misc_3 => Passed
attr_var => Passed
attr_var_2 => Failed
  Fatal error: exception Semanticcheck.NeverHappen
  Undeclared Class: int
attr_var_3 => Passed
attr_var_4 => Failed
  Redeclared Attribute: var
  Undeclared Class: int
attr_var_5 => Failed
  Redeclared Variable: var
  Undeclared Class: int
block_1 => Passed
block_2 => Passed
block_3 => Passed
block_4 => Failed
  Undeclared Class: ClassA
  No error
block_5 => Failed
  Undeclared Class: ClassA
  No error
block_6 => Failed
  Undeclared Class: ClassA
  Undeclared Method: sum
call_1 => Failed
  No error
  TypeMismatch In Statement: CalloneA[(1)].sum((1))
call_2 => Passed
call_3 => Failed
  No error
  TypeMismatch In Expression: oneA[(oneA[(1)].operator)]
call_4 => Failed
  No error
  TypeMismatch In Statement: CalloneA[(self.index)].sum((1))
call_5 => Failed
  No error
  TypeMismatch In Statement: Callself.sum((1))
call_6 => Passed
class => Passed
exp_1 => Passed
exp_10 => Passed
exp_2 => Passed
exp_3 => Passed
exp_4 => Passed
exp_5 => Passed
exp_6 => Passed
exp_7 => Passed
exp_8 => Passed
exp_9 => Passed
exp_call_1 => Failed
  Undeclared Class: ClassA
  Undeclared Method: sum
exp_call_10 => Passed
exp_call_11 => Failed
  Undeclared Class: ClassA
  TypeMismatch In Statement: oneA:=self.sum(1.1)
exp_call_12 => Failed
  Undeclared Class: ClassA
  No error
exp_call_13 => Failed
  Undeclared Class: ClassA
  No error
exp_call_2 => Failed
  No error
  TypeMismatch In Expression: oneA.sum(1.1)
exp_call_3 => Failed
  No error
  TypeMismatch In Expression: oneA.sum(1.1)
exp_call_4 => Failed
  Undeclared Class: ClassA
  Undeclared Method: sum
exp_call_5 => Failed
  No error
  TypeMismatch In Statement: a:=oneA[(1)].sum(1)
exp_call_7 => Passed
exp_call_8 => Passed
exp_call_9 => Failed
  No error
  No Prototype of sum
exp_field_1 => Failed
  No error
  TypeMismatch In Statement: self.operator:=1
exp_field_2 => Failed
  TypeMismatch In Statement: self.operator1:=true
  Undeclared Attribute: operator1
exp_field_3 => Failed
  TypeMismatch In Statement: self.operator1:=true
  Undeclared Attribute: operator1
exp_field_4 => Failed
  No error
  TypeMismatch In Statement: self.operator:=1
exp_field_5 => Failed
  No error
  TypeMismatch In Expression: b.a
exp_member_1 => Failed
  No error
  TypeMismatch In Expression: oneA[(array[(1)])]
exp_new_1 => Failed
  Undeclared Class: ClassA
  Undeclared Class: ClassA1
exp_new_2 => Failed
  Undeclared Class: ClassA
  Undeclared Method: ClassA
exp_new_3 => Failed
  Undeclared Class: ClassA
  Undeclared Method: ClassA
exp_new_4 => Failed
  Undeclared Class: ClassA
  No error
for_1 => Passed
for_10 => Passed
for_2 => Passed
for_3 => Passed
for_4 => Passed
for_5 => Passed
for_6 => Passed
for_7 => Passed
for_8 => Passed
for_9 => Passed
global_1 => Passed
global_2 => Passed
global_3 => Passed
global_4 => Passed
global_5 => Passed
global_6 => Failed
  Fatal error: exception Semanticcheck.NeverHappen
  Undeclared Class: int
global_7 => Passed
global_8 => Passed
id_1 => Passed
if_1 => Passed
if_2 => Passed
if_3 => Passed
if_4 => Passed
inherit_1 => Failed
  Undeclared Class: ClassC
  No error
inherit_2 => Failed
  Undeclared Class: ClassC
  No error
inherit_3 => Failed
  Undeclared Class: ClassD
  No error
inherit_4 => Failed
  Undeclared Class: A
  No error
inherit_5 => Failed
  Undeclared Class: A
  TypeMismatch In Statement: b:=a
method_1 => Failed
  No error
  No Prototype of ClassA
method_2 => Failed
  No error
  No Implementation of ClassA
method_3 => Failed
  No error
  No Prototype of sum
method_4 => Passed
method_5 => Failed
  Redeclared Parameter: a
  Undeclared Class: int
method_6 => Passed
method_7 => Passed
method_8 => Failed
  No error
  No Prototype of sum
method_9 => Failed
  No error
  Redeclared Method: ClassB.ClassB
null_1 => Failed
  TypeMismatch In Statement: b[(1)]:=null
  No error
null_2 => Failed
  Undeclared Class: ClassA
  No error
null_3 => Passed
null_4 => Failed
  Undeclared Class: ClassA
  No error
null_5 => Failed
  Undeclared Class: ClassA
  No error
null_6 => Failed
  Undeclared Class: ClassA
  No error
prototype_1 => Failed
  No error
  No Implementation of var
prototype_10 => Failed
  No error
  Redeclared Method: ClassA
prototype_11 => Failed
  No error
  Redeclared Method: ClassA
prototype_12 => Failed
  No error
  No Prototype of sum
prototype_13 => Failed
  No error
  No Prototype of sum
prototype_14 => Failed
  No error
  No Prototype of sum
prototype_15 => Failed
  No error
  No Implementation of sum
prototype_16 => Failed
  No error
  No Prototype of sum
prototype_17 => Failed
  No error
  No Implementation of sum
prototype_2 => Failed
  No error
  Redeclared Parameter: a
prototype_3 => Failed
  No error
  Undeclared Class: one_class
prototype_4 => Failed
  No error
  Redeclared Method: var
prototype_5 => Failed
  No error
  Redeclared Method: var
prototype_6 => Failed
  No error
  Redeclared Method: var
prototype_7 => Failed
  No error
  Redeclared Method: ClassA
prototype_8 => Failed
  No error
  Redeclared Method: ClassA
prototype_9 => Failed
  No error
  Redeclared Method: ClassA
repeat_1 => Passed
repeat_2 => Passed
repeat_3 => Passed
return_1 => Failed
  Undeclared Class: ClassA
  No error
return_2 => Failed
  Undeclared Class: ClassA
  No error
return_3 => Failed
  Undeclared Class: ClassA
  TypeMismatch In Statement: Return 1.1
stmt_1 => Failed
  Undeclared Class: ClassA
  No error
while_1 => Passed
while_2 => Failed
  Undeclared Class: ClassA
  Redeclared Variable: oneA
while_3 => Failed
  Undeclared Class: ClassA
  No error
_bug_1 => Failed
  No error
  Undeclared Method: sum
_bug_2 => Failed
  No error
  Undeclared Attribute: index
_exp_call_1 => Failed
  Undeclared Class: ClassA
  TypeMismatch In Statement: oneA:=self.sum(1, null)
_exp_call_2 => Failed
  Undeclared Class: ClassA
  No error

--- Results ----------
Passed: 55/129
Failed: 74/129
Result: 42.64%
