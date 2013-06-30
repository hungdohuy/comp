ocamlc -c ast.ml
ocamlc -c pp.ml
ocamlyacc myparser.mly
ocamllex mylexer.mll
ocamlc -c myparser.mli
ocamlc -c mylexer.ml
ocamlc -c myparser.ml
ocamlc -c driver.ml
ocamlc -o driver.exe ast.cmo pp.cmo myparser.cmo mylexer.cmo driver.cmo