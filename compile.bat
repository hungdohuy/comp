@echo off
ocamlc -c ast.ml
ocamlc -c error.ml
ocamlc -c pp.ml
ocamlc -c semanticcheck.ml
ocamlc -c driver.ml
ocamlc -o driver.exe ast.cmo error.cmo pp.cmo myparser.cmo mylexer.cmo semanticcheck.cmo driver.cmo