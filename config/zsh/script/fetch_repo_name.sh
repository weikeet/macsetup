#!/bin/zsh

# todo switch https/ssh, input username

remote_url=$(git remote -v | grep push)
end_content=$(echo $remote_url | awk -F 'github.com:' '{print $2}')
user_repo=$(echo $end_content | awk -F '/' '{print $2}')
repo_name=$(echo $user_repo | awk -F ' ' '{print $1}')

git remote set-url origin git@github.com:weikeet/$repo_name
