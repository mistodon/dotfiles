alias fm="explorer ."

which make &>/dev/null
if [ $? -ne 0 ]; then
    alias make="mingw32-make"
else
    alias make="make"
fi
