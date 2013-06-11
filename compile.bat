@echo off
ocamllex mylexer.mll
ocamlc -c mylexer.ml
ocamlc -c driver.ml
ocamlc -o driver.exe  mylexer.cmo driver.cmo