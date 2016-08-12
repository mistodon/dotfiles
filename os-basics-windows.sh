alias fm="explorer ."

which make 2>/dev/null
if [ $? -ne 0 ]; then
    alias make="mingw32-make -j8"
else
    alias make="make -j8"
fi
