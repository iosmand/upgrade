#!/bin/bash

case $1 in
first)
sudo apt -y remove python2*
sudo apt update
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt autoclean
sudo iptables -I INPUT -p tcp --dport 1022 -j ACCEPT
screen -m do-release-upgrade
;;
second)
sudo apt install -y python2 python3-pip python-is-python3
#curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
python2 get-pip.py
sudo python2 get-pip.py
pip --version
sudo pip --version
pip3 --version
;;
*)
echo -e "Example usage './upgrade-18-20.sh first', './upgrade-18-20.sh second'\nIf you don't know what you are doing please see https://github.com/iOSMANzZz/i0-cloud-vm-updater/"
;;
esac
