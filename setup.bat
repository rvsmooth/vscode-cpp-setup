@echo off

set "currentDir=%~dp0%"
set "zipFile=winlibs.zip"
set "destFolder=C:\"

powershell -Command "Expand-Archive -Path '%currentDir%\%zipFile%' -DestinationPath '%destFolder%' -Force"

echo Done

echo Installing VSCode
set "installer=%currentDir%\vscode.exe"
"%installer%" /silent
echo Done

echo Installing C/C++ extension for VSCode
set "extension=%currentDir%\c.vsix"
code --install-extension "%extension%"
echo Done

echo Adding compiler to PATH
setx PATH "%PATH%;C:\mingw64\bin" /M
echo Done
pause
