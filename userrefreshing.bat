@echo off
set "green=[1;38;2;0;255;0m"
set "red=[1;38;2;255;0;0m"
set "white=[1;38;2;255;255;255m"
title 
cd %userprofile% >nul 2>&1
if exist "hellouser.txt" (
        echo %white%hey there again..
    set "useris=%red%old%white%"
        timeout /t 2 >nul
    goto :data
) else (
        echo hey there..
    set "useris=%green%new%white%"
        cd %userprofile% >nul
    echo .>>hellouser.txt
        timeout /t 2 >nul
    goto :data
)
:main
pause >nul 2>&1
:data
echo type "deleteme" to delete current user, new user (%useris%)
:deletemenow
set /p "dm=>> "
if /i "%dm%"=="" (
    goto :deletemenow
) else if /i "%dm%"=="deleteme" (
    cd %userprofile% >nul
        if exist "hellouser.txt" (
            del hellouser.txt >nul 2>&1
        ) else (
            echo no user to delete..
                timeout /t 2 >nul
            goto :main
        )
) else (
    goto :deletemenow
)
