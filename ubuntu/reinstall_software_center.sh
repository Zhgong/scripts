#!/bin/bash
echo This script will reinstall snapd

sudo snap remove snap-store

sudo apt remove snapd
sudo apt install snapd 

sudo snap install snap-store