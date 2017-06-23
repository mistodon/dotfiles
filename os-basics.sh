if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    source ~/bin/terminal-helpers/os-basics-windows.sh
    source ~/bin/terminal-helpers/windows-compiler-cli.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	source ~/bin/terminal-helpers/os-basics-macos.sh
elif [[ "$OSTYPE" == "linux"* ]]; then
	source ~/bin/terminal-helpers/os-basics-linux.sh
else
    echo "[terminal-helpers] Error: Could not load basic OS helpers for OS of type $OSTYPE"
fi
