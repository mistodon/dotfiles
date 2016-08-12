if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    source ~/bin/terminal-helpers/os-basics-windows.sh
else
    echo "[terminal-helpers] Error: Could not load basic OS helpers for OS of type $OSTYPE"
fi