#!/bin/bash
echo "This script will make a soft link to all the .sh script under this folder"
read -p "Press [Enter] key to start ..."


SOURCE="${BASH_SOURCE[0]}" # ./ubuntu/mklink.sh
echo $SOURCE
DIR="$(dirname $SOURCE)" # ./ubuntu/
echo $DIR
# echo $SELF
for f in $DIR/*.sh 
    do
        echo check $f   # eg. ./ubuntu/reinstall_software_center.sh
        if [ $f != $SOURCE ]; then # do not apply to  self
            echo make link $(pwd)//$f --> /usr/local/bin/
            ln -s $(pwd)/$f /usr/local/bin/
            # echo dummy make link to $(pwd)/$f
        fi
    done