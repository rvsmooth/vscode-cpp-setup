import os
import sys
import subprocess
import shutil
import shlex

script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))

# relevant paths used by main()
sevenzip_path = os.path.join(script_dir, "7zip.exe")
winlibs_path = os.path.join(script_dir, "winlibs.zip")
vs_code_path = os.path.join(script_dir, "vscode.exe")
cpp_path = os.path.join(script_dir, "cpptools.vsix")
gcc_path = os.path.abspath("C:\\mingw64\\bin")
code_path = os.path.abspath(
    os.path.join(
        os.environ["LOCALAPPDATA"], "Programs", "Microsoft VS Code", "bin", "code.cmd"
    )
)
sevenzip_executable = os.path.abspath(
    os.path.join(os.environ["PROGRAMFILES"], "7-Zip", "7z.exe")
)


def run_cmd(path_to_exec, args, args_2nd=None, args_3rd=None):
    args = shlex.split(args)
    if path_to_exec and args:
        cmd = [path_to_exec] + args
    if path_to_exec and args and args_2nd:
        cmd = [path_to_exec] + args + [args_2nd]
    if path_to_exec and args and args_2nd and args_3rd:
        cmd = [path_to_exec] + args + [args_2nd] + [args_3rd]
    subprocess.run(cmd)


# Main function
def main():
    if shutil.which("code"):
        print("VSCode is already installed!!")
    else:
        print("Installing vscode")
        run_cmd(vs_code_path, '/VERYSILENT /NORESTART /MERGETASKS="!runcode"')

    print("Installing cpp extension")
    run_cmd(code_path, "--install-extension", cpp_path)

    print("Installing 7zip")
    run_cmd(sevenzip_path, "/S")

    print("Extracting winlibs")
    if os.path.exists(gcc_path):
        print("GCC is already installed")
    else:
        run_cmd(sevenzip_executable, "x", winlibs_path, "-oC:")

    print("Adding mingw64 to path")
    command_arg = f"%PATH%;{gcc_path}"
    subprocess.run(["setx", "/M", "PATH", command_arg], shell=True)
    print("Setup complete")


# main execution
main()

# wait for user input to exit
input("Press any key to exit")
