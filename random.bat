@echo off
setlocal enabledelayedexpansion
set /a "randnutm=%random% %%2"

if !randnutm! equ 0 (
    echo random worked..!
    pause
) else (
    echo random still worked..
    pause
)