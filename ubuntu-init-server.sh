#!/bin/sh
set -e

sudo apt-get remove docker docker-engine docker.io

sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual apt-transport-https ca-certificates curl git software-properties-common

sudo sh -c 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo systemctl start docker

sudo systemctl enable docker

sudo sh -c 'curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose'

sudo sh -c 'chmod +x /usr/bin/docker-compose'
