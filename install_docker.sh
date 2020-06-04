#!/bin/bash
#
#
#
#
#
#
#

echo reference: https://github.com/ccrisan/motioneye/wiki/Install-In-Docker
step=1

step() {
    echo [* Step: $step *] $1
    step=$(($step+1))
}

quit_error() {
    #quit script while error
    if [[ $? -ne 0 ]]; then
        echo Quit at Step [$step] because of error
        exit $?
    fi
}

step "Download and install docker"
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh

quit_error


step "Give the ‘pi’ user the ability to run Docker."
sudo usermod -aG docker pi

quit_error

step "Check Docker version"
echo docker version
docker version

echo docker info
docker info

quit_error


