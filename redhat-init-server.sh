#!/bin/sh
set -e

sudo yum remove -y container-selinux docker-selinux docker-ce

sudo yum remove docker -y \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum makecache

sudo yum install -y git docker-ce docker-ce-cli containerd.io 

sudo sh -c 'curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose'

sudo sh -c 'chmod +x /usr/bin/docker-compose'

sudo usermod -aG docker $(whoami)

sudo systemctl start docker

sudo systemctl enable docker
