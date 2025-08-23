@echo off

set "currentDir=%~dp0%"
set "zipFile=winlibs.zip"
set "destFolder=C:\"

echo Installing 7zip
%currentDir%\7zip.exe \S
echo Done

call %currentDir%\refrenv.bat

echo Setting up gcc
7z x %zipFile% -o%destFolder%

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
