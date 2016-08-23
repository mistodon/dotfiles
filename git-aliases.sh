alias gs="git status"
alias ga="git add"
alias gr="git reset"
alias gd="git diff"
alias gc="git checkout"
alias gb="git branch"
alias gf="git fetch"
alias gpom="git pull origin master"
alias gpush="git push origin"
alias gsub="git submodule foreach \"(git checkout master; git pull origin master)\""

function gstashpull()
{
    git stash
    git pull origin $1
    git stash pop
}