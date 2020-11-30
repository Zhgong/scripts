#!/bin/bash
echo This script will reinstall snapd

sudo snap remove snap-store

sudo apt remove snapd -y
sudo apt install snapd -y

sudo snap install snap-store