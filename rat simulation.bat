@echo off
set "green=[1;38;2;0;255;0m"
set "red=[1;38;2;255;0;0m"
set "white=[1;38;2;255;255;255m"
echo loading sessions..
timeout /t 5 >nul
echo %green%session%white%                %green%ip%white%                     %green%location%white%
echo --------------------   --------------------   --------------------
echo 0                      109.38.117.128         UK-London
echo 1                      172.166.43.12          USA-Washington DC
timeout /t 2 >nul
pause >nul 2>&1
echo %red%sending%white% to %red%all%white% targets %red%malicious%white% commands..
timeout /t 2 >nul
for /l %%a in (1,1,10000) do (
    echo %%a to 0
    echo %%a to 1
)
cls
echo data downloaded %green%successfully%white% from 0,1 targets..
timeout /t 2 >nul
echo uploading %red%ransomware%white%!
timeout /t 2 >nul
cls
echo %red%3%white%
timeout /t 1 >nul
cls
timeout /t 2 >nul
echo %red%2%white%
timeout /t 1 >nul
cls
timeout /t 2 >nul
echo %red%1%white%
timeout /t 1 >nul
cls
timeout /t 2 >nul
echo %red%WARNING%white%
timeout /t 1 >nul
cls
timeout /t 2 >nul
echo %red%WARNING%white%
timeout /t 1 >nul
cls
timeout /t 2 >nul
echo %red%WARNING%white%
timeout /t 1 >nul
cls
timeout /t 2 >nul
echo %green%uploaded%white% successfully to 0,1..
