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


echo Adding compiler to PATH
setx PATH "%PATH%;C:\mingw64\bin" /M
echo Done
pause
