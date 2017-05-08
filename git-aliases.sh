alias gs="git status"
alias ga="git add"
alias gr="git reset"
alias gd="git diff"
alias gc="git checkout"
alias gb="git branch"
alias gf="git fetch"
alias gpom="git pull origin master"
alias gcurr="git rev-parse --abbrev-ref HEAD"
alias gsub="git submodule foreach \"(git checkout master; git pull origin master)\""


function gpull()
{
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    if [ $? -ne 0 ]; then
        return 1
    fi
    git pull origin "$branch"
}

function gpush()
{
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    if [ $? -ne 0 ]; then
        return 1
    fi
    git push origin "$branch"
}


function gstash()
{
    if [ "$1" == "pull" ]; then
        git stash
        git pull origin $2
        git stash pop
    elif [ "$1" == "show" ]; then
        git stash show stash^{/"$2"}
    elif [ "$1" == "apply" ]; then
        git stash apply stash^{/"$2"}
    else
        echo "gstash: '$1' is not a valid command. (pull|show|apply)" 1>&2
        return 1
    fi
}
