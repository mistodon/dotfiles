alias bell="tput bel"

function makeshow()
{
    make 2> .temp_make_errors
    cat .temp_make_errors
    subl `grep "error:" .temp_make_errors | cut -d " " -f1 | sed 's/.$//'`
    rm .temp_make_errors
}