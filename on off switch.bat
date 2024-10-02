@echo off
set "off=[1;38;2;121;121;121m"
set "on=[1;38;2;0;200;0m"
set "white=[1;38;2;255;255;255m"
echo %white%loading..
set "original=%~dp0"
timeout /t 2 >nul
echo type "on" "off" "check"
:a
set /p "i=>> "
if /i "%i%"=="on" (
    cd %userprofile% >nul 2>&1
        if exist "onoffchecker.txt" (
            echo already on..
                goto :a
        ) else (
            goto :on
        )
) else if /i "%i%"=="off" (
    cd %userprofile% >nul 2>&1
        if not exist "onoffchecker.txt" (
            echo already off..
                goto :a
        ) else (
            goto :off
        )
) else if /i "%i%"=="check" (
    goto :check
) else (
    goto :a
)
:on
cd %userprofile% >nul 2>&1
    echo .>>onoffchecker.txt
        cd %original% >nul 2>&1

echo ---------
echo -- %on%***%white% --
echo ---------
goto :a
:off
cd %userprofile% >nul 2>&1
    del onoffchecker.txt >nul 2>&1
        cd %original% >nul 2>&1

echo ---------
echo -- %off%***%white% --
echo ---------
goto :a
:check
cd %userprofile% >nul 2>&1
if not exist "onoffchecker.txt" (
    echo not active..
echo ---------
echo -- %off%***%white% --
echo ---------
) else (
    echo active..
echo ---------
echo -- %on%***%white% --
echo ---------
)
goto :a
