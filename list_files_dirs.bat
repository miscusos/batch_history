@echo off
color 0a
setlocal enabledelayedexpansion
echo ---directories---
    set "count=0"
for /d %%d in (*) do (
    set /a "count=!count!+1"
echo directory "!count!" "%%d"
    pushd %%d
echo ---directories--- in %%d
for /d %%d in (*) do (
    echo %%d
)
echo ---files--- in %%d
for %%f in (*.*) do (
    echo %%f
    )
)
