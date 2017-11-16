#!/bin/bash

current_branch="$(git rev-parse --abbrev-ref HEAD)"

git rev-list --no-merges origin/$current_branch \
    --not $(git for-each-ref --format="%(refname)" refs/remotes/origin |
    grep -Fv refs/remotes/origin/$current_branch) | (
    while read revision; do
        git grep -F "$1" $revision -- './*' ':(exclude)vendor/*' 
    done
)
