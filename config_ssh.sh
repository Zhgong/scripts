#!/bin/bash
# transfer pub key from mac to pi, so that no password is needed for ssh
# disable ssh for root ssh
# change default password
# PermitRootLogin no
# PermitEmptyPasswords no

config_file="/etc/ssh/ssh_config"

function modify() {
    key_word=$1
    found=$(grep "$key_word no" $config_file)
    if [[ -n $found ]]; then
        echo "Already configured: $found"
        return
    fi
    found=$(grep $key_word $config_file)
    if [[ -z $found ]]; then
        echo ""$key_word" not found in config file, add config"
        echo "$key_word no" >> $config_file
    else
        echo "found "$key_word" in config file, change config"
        sed -i "s/$key_word.*$/$key_word no/g" $config_file
    fi

    grep "$key_word" $config_file
}

modify "PermitRootLogin"
modify "PermitEmptyPasswords"

echo ######################################################################
echo "Don't forget to run command to use ssh without password"
echo "cat ~/.ssh/id_rsa.pub | ssh pi@raspberrypi 'cat >> .ssh/authorized_keys'"
echo ######################################################################

