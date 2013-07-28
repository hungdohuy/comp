::for /L %%i in (1,1,10) do driver testcases\%%i.txt > testsol\%%i.txt 
@echo off
::cat test.txt & echo.
::echo ----------------------
driver test.txt & echo.
::echo ----------------------