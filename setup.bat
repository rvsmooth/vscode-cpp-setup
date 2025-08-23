@echo off
set "zipFile=winlibs.zip"
set "destFolder=C:\"

powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%destFolder%' -Force"

echo Done

set "installer=vscode.exe"
"%installer%" /silent


set "extension=c.vsix"
code --install-extension "%extension%"

pause


