# close enough
function ce()
{
    # Try cd to each argument
    pushd . > /dev/null
    for arg in "$@"
    do
        cd *"$arg"* 2>/dev/null
    done

    if [ $? -ne 0 ]; then

        # If it doesn't work, chop off first character of each
        #   (Really hacky, brittle case-insensitivity)
        popd > /dev/null
        pushd . > /dev/null
        for arg in "$@"
        do
            cd *"${arg:1}"* 2>/dev/null
        done

        if [ $? -ne 0 ]; then
            echo "ce: '$@': No such file or directory (reached `pwd`)"
            popd > /dev/null
        else
            popd -n > /dev/null
        fi
    else
        popd -n > /dev/null
    fi
}