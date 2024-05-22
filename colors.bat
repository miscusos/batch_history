@echo off
setlocal enabledelayedexpansion
:randomColor
set /a r=%random% %% 256
set /a g=%random% %% 256
set /a b=%random% %% 256
set "color=[1;38;2;%r%;%g%;%b%m"
echo !color! %r% %g% %b% %r% %g% %b% %r% %g% %b% %r% %g% %b% %r% %g% %b% %r% %g% %b%
goto randomColor
