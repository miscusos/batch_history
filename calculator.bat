@echo off
color 0a
cls
goto calc
:calc
echo enter numbers, (+ - / *), type "exit" to exit..
	set /p "number=>> "
if "%number%"=="" (
	echo please enter numbers and operator..
			timeout /t 4 >nul
			cls
		goto calc
) else if "%number%"=="exit" (
	goto no
)
set /a "res=%number%" >nul 2>&1
echo ^|+--------------+^|
echo   answer is %res%
echo ^|+--------------+^|
	timeout /t 2 >nul
goto calc
:no
echo bye..
	timeout /t 2 >nul
exit