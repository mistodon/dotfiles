# close enough
function ce()
{
    for arg in "$@"
    do
        cd *"$arg"*
    done
}