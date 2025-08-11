#!/bin/bash

note=$1
port=$2
user=$3
hostname=$4
identity_file="id_rsa.$1"

echo "execute command: ssh-keygen -t rsa -C $note -f ~/.ssh/$identity_file"
ssh-keygen -t rsa -C $note -f ~/.ssh/$identity_file
echo ""

echo "execute command: ssh-copy-id -i ~/.ssh/id_rsa.$identity_file.pub -p $port $user@$hostname"
ssh-copy-id -i ~/.ssh/$identity_file.pub -p $port $user@$hostname
echo ""

# fixme compat linux, --apple-use-keychain for mac only
echo "execute command: ssh-add --apple-use-keychain ~/.ssh/$identity_file"
ssh-add --apple-use-keychain ~/.ssh/$identity_file
echo ""

echo "if execute ssh-copy-id successfully, you can add the following config to ~/.ssh/config"
echo "Host $note
    HostName $hostname
    User $user
    Port $port
    IdentityFile ~/.ssh/$identity_file"
echo ""

echo "then you can use ssh $note to connect server: $hostname:$port"
echo ""