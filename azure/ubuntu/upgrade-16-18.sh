#!/bin/bash

case $1 in
first)
clear
mkdir backup && mkdir backup/etc && mkdir backup/etc/ssh
sudo cp -r /etc/ssh/* backup/etc/ssh/
#sudo su -
sudo apt update
sudo apt -y dist-upgrade
echo Now reboot
sudo reboot
;;
second)
sudo iptables -I INPUT -p tcp --dport 1022 -j ACCEPT
screen -m do-release-upgrade
;;
*)
echo -e "Example usage './upgrade-16-18.sh first', './upgrade-16-18.sh second'\nIf you don't know what you are doing please see https://github.com/iOSMANzZz/i0-cloud-vm-updater/"
;;
esac
