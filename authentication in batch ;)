@echo off
color 0a
set "red=[1;38;2;255;0;0m"
set "yellow=[1;38;2;255;255;0m"
set "green=[1;38;2;0;255;0m"
set "white=[1;38;2;255;255;255m"
set "rightuser=user"
set "rightpass=123"
echo %white%enter your user name to access the data..
:u
set /p "user=user> "
if /i "%user%"=="" (
    goto :u
) else (
    goto :next
)
:next
echo enter your password now..
:p
set /p "pass=password> "
if /i "%pass%"=="" (
    goto :p
) else (
    goto :check
)
:check
echo %yellow%checking%white%..
    timeout /t 2 >nul
if /i "%user%" equ "%rightuser%" (
    goto :pc
) else (
    cls
echo access is %red%denied%white%!
        pause >nul 2>&1
    exit /b 1
)
:pc
if /i "%pass%" equ "%rightpass%" (
    goto :access
) else (
    cls
echo access is %red%denied%white%!
        pause >nul 2>&1
    exit /b 1
)
:access
cls
    echo you have %green%access%white% to sensitive data..
pause >nul 2>&1
