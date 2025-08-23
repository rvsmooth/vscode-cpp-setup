@echo off

echo Installing C/C++ extension for VSCode
set "extension=%currentDir%\c.vsix"
code --install-extension "%extension%"
echo Done

pause

