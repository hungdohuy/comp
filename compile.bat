@echo off
printf "Compiling result:\n"
ocamlyacc myparser.mly
::checking generate parser
if %errorlevel% NEQ 0 (
	printf "An error occurs while parsing. error %errorlevel%!\n"
	goto ERROR_BUILD
	)
ocamllex mylexer.mll
::checking generate lexical
if %errorlevel% NEQ 0 (
	printf "An error occurs while generating lexical, error %errorlevel%!\n"
	goto ERROR_BUILD
)
ocamlc -c myparser.mli
ocamlc -c mylexer.ml
ocamlc -c myparser.ml
ocamlc -c driver.ml
::checking compile
if %errorlevel% NEQ 0 (
	printf "Compile error %errorlevel%!\n"
	goto ERROR_BUILD
)
ocamlc -o driver.exe myparser.cmo mylexer.cmo driver.cmo
::checking link file
if %errorlevel% NEQ 0 (
	printf "Link error %errorlevel%!\n"
	goto ERROR_BUILD
)

printf "The project was built successful ^_^\n"
exit
:ERROR_BUILD
	printf "Building the project was not successful @.@\n"


