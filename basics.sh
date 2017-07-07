# close enough
function ce()
{
    pushd . > /dev/null
    for arg in "$@"
    do
        local options=$(ls -d .*/ */ 2>/dev/null | grep -i "$arg" | awk '{ print length($0) " " $0; }' | sort -n | cut -d ' ' -f 2- | head -n 1)
        if [ -n "$options" ]; then
            cd "$options" 2>/dev/null
        else
            cd "$@" 2>/dev/null
        fi

        if [ $? -ne 0 ]; then
            echo "ce: '$@': No such file or directory (reached `pwd`)" 1>&2
            popd > /dev/null
            return 1
        fi
    done
    popd -n > /dev/null
}

# From http://onethingwell.org/post/586977440/mkcd-improved
function mkcd()
{
    mkdir -p "$*"
    cd "$*"
}

# Shortcut to exit shell quickly
function qq()
{
    exit
}
