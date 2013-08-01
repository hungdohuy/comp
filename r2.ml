
--- Testing ---------

1 => Passed
attr_const => Passed
attr_misc => Passed
attr_misc_2 => Passed
attr_misc_3 => Passed
attr_var => Passed
attr_var_2 => Failed
  No error
  Undeclared Class: int
attr_var_3 => Failed
  No error
  Undeclared Class: int
attr_var_4 => Failed
  Redeclared Attribute: var
  Undeclared Class: int
attr_var_5 => Failed
  Redeclared Variable: var
  Undeclared Class: int
block_1 => Passed
block_2 => Passed
block_3 => Passed
block_4 => Passed
block_5 => Passed
block_6 => Failed
  No error
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
  No error
  Undeclared Method: sum
exp_call_10 => Passed
exp_call_11 => Passed
exp_call_12 => Failed
  TypeMismatch In Statement: oneA:=self.sum(1, 1.1)
  No error
exp_call_13 => Failed
  TypeMismatch In Statement: oneA:=self.sum(1, 1)
  No error
exp_call_2 => Failed
  No error
  TypeMismatch In Expression: oneA.sum(1.1)
exp_call_3 => Failed
  No error
  TypeMismatch In Expression: oneA.sum(1.1)
exp_call_4 => Failed
  No error
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
exp_new_1 => Passed
exp_new_2 => Failed
  No error
  Undeclared Method: ClassA
exp_new_3 => Failed
  No error
  Undeclared Method: ClassA
exp_new_4 => Passed
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
  No error
  Undeclared Class: int
global_7 => Passed
global_8 => Failed
  No error
  Undeclared Class: int
id_1 => Passed
if_1 => Passed
if_2 => Passed
if_3 => Passed
if_4 => Passed
inherit_1 => Passed
inherit_2 => Passed
inherit_3 => Passed
inherit_4 => Failed
  TypeMismatch In Statement: a:=d
  No error
inherit_5 => Passed
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
  TypeMismatch In Statement: oneA:=c
  No error
null_3 => Passed
null_4 => Failed
  TypeMismatch In Statement: oneA:=self.sum(1, null)
  No error
null_5 => Failed
  TypeMismatch In Statement: oneA:=self.sum(null)
  No error
null_6 => Failed
  TypeMismatch In Statement: a:=null
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
  TypeMismatch In Statement: b:=self
  No error
return_2 => Failed
  TypeMismatch In Statement: b:=self
  No error
return_3 => Failed
  TypeMismatch In Statement: b:=self
  TypeMismatch In Statement: Return 1.1
stmt_1 => Failed
  TypeMismatch In Statement: b:=self
  No error
while_1 => Passed
while_2 => Passed
while_3 => Passed
_bug_1 => Failed
  No error
  Undeclared Method: sum
_bug_2 => Failed
  No error
  Undeclared Attribute: index
_exp_call_1 => Passed
_exp_call_2 => Failed
  TypeMismatch In Statement: oneA:=self.sum(1, null)
  No error

--- Results ----------
Passed: 66/129
Failed: 63/129
Result: 51.16%
