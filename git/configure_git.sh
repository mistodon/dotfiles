#!/bin/bash

set -e

readonly git_dir=$(cd $(dirname $BASH_SOURCE); pwd)

git config --global core.hooksPath ${git_dir}/hooks
git config --global core.excludesfile ${git_dir}/gitignore
git config --global core.editor vim
git config --global user.useConfigOnly true
git config --global --unset-all user.email
