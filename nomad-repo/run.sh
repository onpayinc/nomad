#!/usr/bin/env bash

echo "Ensuring known_hosts exists..."
touch ~/.ssh/known_hosts

echo "Scanning for bitbucket.org key...."

ssh-keygen -F bitbucket.org
if [[ $? != 0 ]]; then
    ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts
fi

echo "Scanning for github.com key...."
ssh-keygen -F github.com
if [[ $? != 0 ]]; then
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
fi

eval "$(ssh-agent)"
/usr/bin/ssh-add /nomad/nomad-repo/id_rsa

while [[ 1 == 1 ]];
do
    if [ -d "/nomad-repo" ]; then
        echo "Git Pulling repo..."
        cd /nomad-repo
        git pull | true
    else
        echo "Cloning nomad-repo down to local machine..."
        git clone git@bitbucket.org:onpay/nomad.git /nomad-repo | true
    fi

    echo "Sleeping for 1 minute..."
    /bin/sleep 1m
done
