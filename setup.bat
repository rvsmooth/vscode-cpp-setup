@echo off

set "currentDir=%~dp0%"
set "peazip=%currentDir%\peazip\peazip.exe"
set "zipFile=winlibs.zip"
set "destFolder=C:\"

%peazip% -ext2folder -o"%destFolder%" '%zipFile%'

echo Done

echo Installing VSCode
set "installer=%currentDir%\vscode.exe"
"%installer%" /silent
echo Done

call %currentDir%\refrenv.bat

echo Installing C/C++ extension for VSCode
set "extension=%currentDir%\c.vsix"
code --install-extension "%extension%"
echo Done

echo Adding compiler to PATH
setx PATH "%PATH%;C:\mingw64\bin" /M
echo Done
pause
