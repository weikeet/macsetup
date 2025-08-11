#!/bin/bash

user=$1
platform=$2
settings_ssh_key=$3

note="$platform.$user"
identity_file="id_rsa.$platform.$user"

echo "execute command: ssh-keygen -t rsa -C $note -f ~/.ssh/$identity_file"
ssh-keygen -t rsa -C $note -f ~/.ssh/$identity_file
echo ""

echo "execute command: cat ~/.ssh/$identity_file.pub"
cat ~/.ssh/$identity_file.pub
echo ""

echo ""
echo "Please copy public key to git -> $settings_ssh_key -> ssh keys"
echo ""

# fixme compat linux, --apple-use-keychain for mac only
echo "execute command: ssh-add --apple-use-keychain ~/.ssh/$identity_file"
ssh-add --apple-use-keychain ~/.ssh/$identity_file
echo ""

echo "if add ssh keys to git successfully, you can execute the command: ssh -T git@$platform.com to test the connection"
echo ""

echo "you can add the following config to ~/.ssh/config"
echo "Host $note
    HostName $platform.com
    User $user
    IdentityFile ~/.ssh/$identity_file"
echo ""