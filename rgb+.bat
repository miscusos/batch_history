@echo off
set "white=[1;38;2;255;255;255m"
set "red=[1;38;2;255;0;0m"
set "green=[1;38;2;0;255;0m"
set "blue=[1;38;2;0;0;255m"
goto :sss
:help
echo you'll get a colored text at the final or a blank with only rgb..
echo you can enter at "%red%R%white%" 255 for example and same at "%green%G%white%", "%blue%B%white%" 
goto :start
:sss
echo %white%want to continue? ("yes"\"no"\"help")
:start
set /p "text=>>%white% "
if /i "%text%"=="" (
    goto :start
) else if /i "%text%"=="yes" (
    goto :yes
) else if /i "%text%"=="no" (
    echo okay, bye..
        timeout /t 2 >nul
    exit /b 1
) else if /i "%text%"=="help" (
    goto :help
) else (
    goto :start
)
:yes
cls
echo okay, enter the "%red%R%white%" from %red%R%white%GB..
:r
set /p "r=%red%R%white%> "
if /i "%r%"=="" (
    goto :r
) else if /i "%r%"=="r" (
    echo noo, hahah, the code..
) else (
    set "rs=[1;38;2;%r%;0;0m"
    goto :next
)
:next
cls
echo okay, enter the "%green%G%white%" from R%green%G%white%B..
:g
set /p "g=%green%G%white%> "
if /i "%g%"=="" (
    goto :g
) else if /i "%g%"=="g" (
    echo noo, hahah, the code..
) else (
    set "gs=[1;38;2;0;%g%;0m"
    goto :next2
)
:next2
cls
echo okay, enter the "%blue%B%white%" from RG%blue%B%white%..
:b
set /p "b=%blue%B%white%> "
if /i "%b%"=="" (
    goto :b
) else if /i "%b%"=="b" (
    echo noo, hahah, the code..
) else (
    set "bs=[1;38;2;0;0;%b%m"
    goto :final
)
:final
cls
echo nice, you've done well..
    timeout /t 1 >nul
echo now, enter your text..
:fn
set "color=[1;38;2;%r%;%g%;%b%m"
set "white=[1;38;2;255;255;255m"
set /p "final=text> "
if /i "%final%"=="" (
    goto :fn
) else (
    echo colored text is "%color%%final%%white%"
    echo                       ^|
    echo                       ^|
    echo                       +
    echo %red%R%white%%green%G%white%%blue%B%white% ---^> %rs%%r% %gs%%g% %bs%%b%%white% ^<---
        pause >nul 2>&1
color 0f
)