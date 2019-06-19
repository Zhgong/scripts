#!/bin/bash

printf "Enter ssid:"
read ssid
printf "Enter passphrase:"
read passphrase

result=$(wpa_passphrase ${ssid} ${passphrase})
if [[ $? -ne 0 ]]; then
        echo ${result}
        exit
fi

echo "generated wpa_supplicant.conf:"
echo "#== copy and past following content to 'wpa_supplicant.conf' and put it in /boot on SD card: ==#"
echo country=GB
echo ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
echo update_config=1
printf "%s\n\t%s\n\t%s\n\t%s\n%s" ${result}
