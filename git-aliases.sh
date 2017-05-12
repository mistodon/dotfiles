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
    git pull --rebase origin "$branch"
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
    git stash
    "$@"
    git stash pop
}
