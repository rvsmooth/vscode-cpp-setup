@echo off

set "currentDir=%~dp0"
set "zipFile=winlibs.zip"
set "destFolder=C:\"
set "sevenzip=C:\Program Files\7-Zip\7z.exe"

echo Installing 7zip
%currentDir%\7zip.exe /S
echo Done

echo Setting up gcc
"%sevenzip%" x "%currentDir%%zipFile%" -o"%destFolder%"

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
