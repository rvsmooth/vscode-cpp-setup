import os
import sys
import subprocess
import shutil
import shlex

script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))

sevenzip_path = os.path.join(script_dir, "7zip.exe")
winlibs_path = os.path.join(script_dir, "winlibs.zip")
vs_code_path = os.path.join(script_dir, "vscode.exe")

cpp_dir = os.path.join(script_dir, "cpptools.vsix")
cmd = [vs_code_path, "/VERYSILENT", "/NORESTART", '/MERGETASKS="!runcode"']
code_path = os.path.abspath(
    os.path.join(
        os.environ["LOCALAPPDATA"], "Programs", "Microsoft VS Code", "bin", "code.cmd"
    )
)
sevenzip_executable = os.path.abspath(
    os.path.join(os.environ["PROGRAMFILES"], "7-Zip", "7z.exe")
)


def run_cmd(path_to_exec, args, args_2nd, args_3rd):
    args = shlex.split(args)
    cmd = [path_to_exec] + args
    subprocess.run(cmd)


# Main execution
if shutil.which("code"):
    print("VSCode is already installed!!")
else:
    print("Installing vscode")
    run_cmd(vs_code_path, '/VERYSILENT /NORESTART /MERGETASKS="!runcode"')

print("Installing cpp extension")
run_cmd(code_path, "--install-extension", cpp_dir)

print("Installing 7zip")
run_cmd(sevenzip_path, "/S")

print("Extracting winlibs")
run_cmd(sevenzip_executable, "x", winlibs_path, "-oC:")
