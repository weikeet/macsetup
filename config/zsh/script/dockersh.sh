#!/bin/zsh

name=$1

docker_id=$(docker ps | grep $name | awk -F ' ' '{print $1}')

if [[ $docker_id ]];then
    echo "$name Docker 服务已启动, id=$docker_id"
else
    echo "$name Docker 服务未启动."
    exit 0
fi

docker exec -it $docker_id /bin/bash
