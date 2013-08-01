
--- Testing ---------

1 => Passed
  No error
  No error
attr_const => Passed
  Redeclared Attribute: c
  Redeclared Attribute: c
attr_misc => Passed
  Redeclared Attribute: m
  Redeclared Attribute: m
attr_misc_2 => Passed
  Redeclared Class: ClassA
  Redeclared Class: ClassA
attr_misc_3 => Passed
  Redeclared Attribute: m
  Redeclared Attribute: m
attr_var_1 => Passed
  Redeclared Attribute: var
  Redeclared Attribute: var
attr_var_2 => Failed
  Fatal error: exception Semanticcheck.NeverHappen
  Undeclared Class: int
attr_var_3 => Passed
  Undeclared Class: int
  Undeclared Class: int
attr_var_4 => Failed
  Redeclared Attribute: var
  Undeclared Class: int
attr_var_5 => Failed
  Redeclared Variable: var
  Undeclared Class: int
attr_var_6 => Failed
  No error
  Undeclared Class: int
attr_var_7 => Passed
  Redeclared Variable: ClassA
  Redeclared Variable: ClassA
attr_var_8 => Failed
  Fatal error: exception Semanticcheck.NeverHappen
  No error
block_1 => Passed
  Redeclared Variable: a
  Redeclared Variable: a
block_2 => Passed
  No error
  No error
block_3 => Passed
  Redeclared Constant: c
  Redeclared Constant: c
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
  No error
  No error
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
  No error
  No error
class => Passed
  Redeclared Class: ClassA
  Redeclared Class: ClassA
exp_1 => Passed
  TypeMismatch In Expression: (5.3)<>(5.3)
  TypeMismatch In Expression: (5.3)<>(5.3)
exp_10 => Passed
  No error
  No error
exp_2 => Passed
  TypeMismatch In Expression: (5.3)==(5.3)
  TypeMismatch In Expression: (5.3)==(5.3)
exp_3 => Passed
  No error
  No error
exp_4 => Passed
  TypeMismatch In Expression: (1)%(2.2)
  TypeMismatch In Expression: (1)%(2.2)
exp_5 => Passed
  No error
  No error
exp_6 => Passed
  TypeMismatch In Expression: (1)\(2.2)
  TypeMismatch In Expression: (1)\(2.2)
exp_7 => Passed
  No error
  No error
exp_8 => Passed
  TypeMismatch In Expression: (1.1)\(1)
  TypeMismatch In Expression: (1.1)\(1)
exp_9 => Passed
  TypeMismatch In Statement: a:=(1.1)/(1)
  TypeMismatch In Statement: a:=(1.1)/(1)
exp_call_1 => Failed
  Undeclared Class: ClassA
  Undeclared Method: sum
exp_call_10 => Passed
  No error
  No error
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
  No error
  No error
exp_call_8 => Passed
  No error
  No error
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
exp_member_2 => Failed
  No error
  No Prototype of sum
exp_member_3 => Passed
  No error
  No error
exp_member_4 => Passed
  TypeMismatch In Expression: a[(index)]
  TypeMismatch In Expression: a[(index)]
exp_member_5 => Passed
  Undeclared Identifier: index
  Undeclared Identifier: index
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
  No error
  No error
for_10 => Passed
  No error
  No error
for_2 => Passed
  TypeMismatch In Statement: For(i=1,f,i++)i:=i
  TypeMismatch In Statement: For(i=1,f,i++)i:=i
for_3 => Passed
  TypeMismatch In Statement: For(i=1,1.1,i++)i:=i
  TypeMismatch In Statement: For(i=1,1.1,i++)i:=i
for_4 => Passed
  No error
  No error
for_5 => Passed
  TypeMismatch In Statement: For(i=1,f[(2)],i++)i:=1
  TypeMismatch In Statement: For(i=1,f[(2)],i++)i:=1
for_6 => Passed
  TypeMismatch In Statement: For(i=1.1,100,i++)i:=1
  TypeMismatch In Statement: For(i=1.1,100,i++)i:=1
for_7 => Passed
  No error
  No error
for_8 => Passed
  No error
  No error
for_9 => Passed
  No error
  No error
global_1 => Passed
  Redeclared Variable: var
  Redeclared Variable: var
global_2 => Passed
  Redeclared Constant: c
  Redeclared Constant: c
global_3 => Passed
  Redeclared Variable: var
  Redeclared Variable: var
global_4 => Passed
  Redeclared Variable: var
  Redeclared Variable: var
global_5 => Passed
  Redeclared Constant: c
  Redeclared Constant: c
global_6 => Failed
  Fatal error: exception Semanticcheck.NeverHappen
  Undeclared Class: int
global_7 => Passed
  Redeclared Constant: c
  Redeclared Constant: c
global_8 => Passed
  Undeclared Class: int
  Undeclared Class: int
global_9 => Passed
  Undeclared Class: b
  Undeclared Class: b
id_1 => Passed
  Undeclared Identifier: c
  Undeclared Identifier: c
if_1 => Passed
  No error
  No error
if_2 => Passed
  TypeMismatch In Statement: If a Then a:=1
  TypeMismatch In Statement: If a Then a:=1
if_3 => Passed
  No error
  No error
if_4 => Passed
  No error
  No error
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
inherit_6 => Failed
  Undeclared Class: A
  No error
inherit_7 => Failed
  Undeclared Class: A
  No error
inherit_8 => Failed
  Undeclared Class: A
  No error
inherit_9 => Failed
  Undeclared Class: A
  TypeMismatch In Statement: Return a
method_1 => Failed
  No error
  No Prototype of ClassA
method_10 => Failed
  No error
  Undeclared Class: ClassA
method_2 => Failed
  No error
  No Implementation of ClassA
method_3 => Failed
  No error
  No Prototype of sum
method_4 => Passed
  Redeclared Parameter: a
  Redeclared Parameter: a
method_5 => Failed
  Redeclared Parameter: a
  Undeclared Class: int
method_6 => Passed
  Redeclared Constant: a
  Redeclared Constant: a
method_7 => Passed
  Redeclared Variable: a
  Redeclared Variable: a
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
  No error
  No error
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
prototype_18 => Failed
  No error
  Undeclared Class: B
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
  No error
  No error
repeat_2 => Passed
  TypeMismatch In Statement: Repeat[If (i)>(5) Then quitCondition:=true Else i:=(i) + (1)]UntilquitCondition
  TypeMismatch In Statement: Repeat[If (i)>(5) Then quitCondition:=true Else i:=(i) + (1)]UntilquitCondition
repeat_3 => Passed
  TypeMismatch In Statement: Repeat[i:=2.1]UntilquitCondition
  TypeMismatch In Statement: Repeat[i:=2.1]UntilquitCondition
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
  TypeMismatch In Expression: not(a)
  TypeMismatch In Expression: not(a)
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
_bug_3 => Failed
  Undeclared Class: A
  Undeclared Class: B
_exp_call_1 => Failed
  Undeclared Class: ClassA
  TypeMismatch In Statement: oneA:=self.sum(1, null)
_exp_call_2 => Failed
  Undeclared Class: ClassA
  No error

--- Results ----------
Passed: 61/144
Failed: 83/144
Result: 42.36%

[*] First log line is your output
