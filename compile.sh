ocamllex mylexer.mll
ocamlc -c mylexer.ml
ocamlc -c driver.ml
ocamlc -o driver.out mylexer.cmo driver.cmo