@echo off
title 
mode 58,13 >nul 2>&1
set "original=%~dp0"
cd %userprofile% >nul 2>&1
    del customrgbforyou.txt >nul 2>&1
cd %original% >nul 2>&1
set "green=[1;38;2;0;255;0m"
set "red=[1;38;2;255;0;0m"
set "blue=[1;38;2;0;0;255m"
set "white=[1;38;2;255;255;255m"
echo %white%enter the color name to choose..
:cl
echo type %red%red%white%
echo type %green%green%white%
echo type %blue%blue%white%
echo or type "%red%r%green%g%blue%b%white%" for custom %red%R%green%G%blue%B%white% setting..
set /p "color=>> "
if /i "%color%"=="" (
    goto :cl
) else if /i "%color%"=="red" (
    set "finalcolor=%red%"
        goto :cf
) else if /i "%color%"=="green" (
    set "finalcolor=%green%"
        goto :cf
) else if /i "%color%"=="blue" (
    set "finalcolor=%blue%"
        goto :cf
) else if /i "%color%"=="rgb" (
    goto :customrgbset
) else (
    goto :cf
)
:customrgbset
echo enter the %red%R%white% code..
:redd
set /p "red=%red%R%white% "
if /i "%red%"=="" (
    goto :redd
) else (
    goto :g
)
:g
echo enter the %green%G%white% code..
:greenn
set /p "green=%green%G%white% "
if /i "%green%"=="" (
    goto :greenn
) else (
    goto :b
)
:b
echo enter the %blue%B%white% code..
:greenn
set /p "blue=%blue%B%white% "
if /i "%blue%"=="" (
    goto :bluee
) else (
    goto :setrgb
)
:setrgb
    cd %userprofile% >nul 2>&1
        echo .>>customrgbforyou.txt
    cd %original% >nul 2>&1
set "customrgbset=[1;38;2;%red%;%green%;%blue%m"
    goto :cf
:cf
echo enter the file name to open..
:file
set /p "name=>> "
if /i "%name%"=="" (
    goto :file
) else (
    if exist "%name%" (
        goto :readd
    ) else (
        echo file doesn't exist..
            timeout /t 2 >nul
        goto :cf
    )
)
:readd
cd %userprofile% >nul 2>&1
    if exist "customrgbforyou.txt" (
            cd %original% >nul 2>&1
        for /f "delims=*" %%g in (%name%) do (
            echo %customrgbset%%%g%white%
                pause >nul 2>&1
        )
            goto :readd
    ) else (
            cd %original% >nul 2>&1
        for /f "delims=*" %%f in (%name%) do (
            echo %finalcolor%%%f%white%
                pause >nul 2>&1
        )
    goto :readd
)