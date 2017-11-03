#!/bin/sh

set -e

readonly git_dir=`dirname $BASH_SOURCE`

git config --global core.excludesfile ${git_dir}/gitignore
git config --global core.editor vim
git config --global user.useConfigOnly true
git config --global --unset-all user.email
