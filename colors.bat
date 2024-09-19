@echo off
setlocal enabledelayedexpansion
:randomColor
set /a r=%random% %% 256
set /a g=%random% %% 256
set /a b=%random% %% 256
set "black=[1;38;2;0;0;0m"
set "color=[1;38;2;%r%;%g%;%b%m"
echo !color! %r%%black%;%color%%g%%black%;%color%%b%    %black%black text    %color%example text in the color%back%..
goto randomColor
