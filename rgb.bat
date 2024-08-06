@echo off
echo hello..
echo you want this text to be colored right? (yes/no)
:inp
set /p "input=>> "
if "%input%"=="" (
	goto inp
) else if /i "%input%"=="yes" (
	goto input2
) else if /i "%input%"=="no" (
	echo okay..
	pause >nul 2>&1
    exit
) else (
	goto inp
)
:input2
cls
echo okay..
echo enter the R from RGB
:R
set /p "R=>> "
if "%R%"=="" (
	goto R
)
:G
cls
echo okay..
echo enter the G from RGB
:R
set /p "G=>> "
if "%G%"=="" (
	goto G
)
:B
cls
echo okay..
echo enter the B from RGB
:R
set /p "B=>> "
if "%B%"=="" (
	goto B
)
set "white=[1;38;2;255;255;255m"
set "color=[1;38;2;%R%;%G%;%B%m"
timeout /t 1 >nul
echo done..
:txt
cls
echo now enter the text you want to display it in the color..
set /p "text=>> "
if "%text%"=="" (
	goto txt
)
echo %white%"%color%%text%%white%"
pause >nul 2>&1
