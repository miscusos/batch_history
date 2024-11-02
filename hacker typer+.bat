@echo off
title 
mode 58,13 >nul 2>&1
set "original=%~dp0"
cd %userprofile% >nul 2>&1
    del customrgbforyou.txt >nul 2>&1
cd %original% >nul 2>&1
set "reset=[0m"
set "bg=[1;48;2;255;255;0m"
set "green=[1;38;2;0;255;0m"
set "red=[1;38;2;255;0;0m"
set "blue=[1;38;2;0;0;255m"
set "purple=[1;38;2;169;0;169m"
set "yellow=[1;38;2;255;255;0m"
set "pink=[1;38;2;255;182;193m"
set "white=[1;38;2;255;255;255m"
echo             %bg%%red%enter the color name to choose..%reset%
:cl
echo type %red%red%white%
echo type %green%green%white%
echo type %blue%blue%white%
echo type %yellow%yellow%white%
echo type %pink%pink%white%
echo type %purple%purple%white%
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
) else if /i "%color%"=="yellow" (
    set "finalcolor=%yellow%"
        goto :cf
) else if /i "%color%"=="purple" (
    set "finalcolor=%purple%"
        goto :cf
) else if /i "%color%"=="pink" (
    set "finalcolor=%pink%"
        goto :cf
) else if /i "%color%"=="rgb" (
    goto :customrgbset
) else (
    goto :file
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
    goto :file
:at
echo you want ghost typing? "yes" "no"
:yna
set /p "auto=>> "
if /i "%auto%"=="yes" (
    cd %userprofile% >nul 2>&1
        if exist "ghosttyping.txt" (
            echo ghost typing already active..
                timeout /t 1 >nul
            goto :at
        ) else (
            echo .>>ghosttyping.txt
                cd %original% >nul 2>&1
            goto :readd
        )
) else if /i "%auto%"=="no" (
    cd %userprofile% >nul 2>&1
        if exist "ghosttyping.txt" (
            del ghosttyping.txt >nul 2>&1
                cd %original% >nul 2>&1
    goto :readd
        ) else (
            echo ghost typing not active..
                timeout /t 1 >nul
            goto :at
        )
) else (
    goto :yna
)
:cf
echo enter the file name to open..
:file
set /p "name=>> "
if /i "%name%"=="" (
    goto :file
) else (
    if exist "%name%" (
        goto :at
    ) else (
        echo file doesn't exist..
            timeout /t 2 >nul
        goto :cf
    )
)
:readd
echo note, it has bugs at colors..
    timeout /t 2 >nul
        cls
cd %userprofile% >nul 2>&1
    if exist "ghosttyping.txt" (
cd %original% >nul 2>&1
    if exist "customrgbforyou.txt" (
            cd %original% >nul 2>&1
        for /f "delims=*" %%g in (%name%) do (
            echo %customrgbset%%%g%white%
                timeout /t 1 >nul
        )
            goto :readd
    ) else (
            cd %original% >nul 2>&1
        for /f "delims=*" %%f in (%name%) do (
            echo %finalcolor%%%f%white%
                timeout /t 1 >nul
        )
    goto :readd
)   
    ) else (
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
    )
