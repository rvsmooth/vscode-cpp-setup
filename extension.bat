@echo off

set "currentDir=%~dp0"

echo Installing C/C++ extension for VSCode
set "extension=%currentDir%\cpptools.vsix"
code --install-extension "%extension%"
echo Done

pause

