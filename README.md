# vscode-cpp-setup
As the name suggests, this is a program, written in python, to install,
setup vscode for C/C++ compiling, formatting etc.

Well, I am primarily a linux user, but I had to write this for my college,
so that I can setup my vscode there with one click.

As for why it doesn't download the binaries instead uses supplied local 
binaries to do the installation is, I want it to be fast and also coz
the college wifi ain't so fast.

## Instructions
It installs and sets up,
- [vscode](https://code.visualstudio.com/)
- [winlibs](https://winlibs.com/)
- [cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [7zip](https://www.7-zip.org/)

so we precisely need those, download them and put them in the same folder
as of the [binary](https://github.com/rvsmooth/vscode-cpp-setup/releases/latest/download/vsc.exe) and rename the files as follows,
vscodebinary - `vscode.exe`
winlibs archive - `winlibs.zip`
cpptools extension - `cpptools.vsix`
7zip - `7zip.exe`

and then run setup.exe as administrator
