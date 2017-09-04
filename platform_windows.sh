function fm { explorer . ; }


which make &>/dev/null
if [ $? -ne 0 ]; then
    alias make="mingw32-make"
else
    alias make="make"
fi


function msvcup
{
    export PATH="C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin:C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\Bin:C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE:$PATH"
    export INCLUDE="C:\Program Files\Microsoft SDKs\Windows\v7.1\Include;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\Include;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\include;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10586.0\ucrt\;$INCLUDE"
    export LIB="C:\Program Files\Microsoft SDKs\Windows\v7.1\Lib;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\lib;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10586.0\ucrt\x86;$LIB"
}


function msbuild
{
    echo "WARNING: This function is pure janky and has a hardcoded path in it"
    echo "  If you installed this repo anywhere but ~/bin/terminal-helpers it ain't gonna work"
    cmd "/C %HOME%/bin/terminal-helpers/windows_bats/msbuild.bat $@"
}

