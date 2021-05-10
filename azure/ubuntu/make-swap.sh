#!/bin/bash
# MAKE SWAP script tested Ubuntu 20 LTS

usage_error="\nExample usage for 1GB swap './make-swap.sh create 1G' , \nExample usage for 500MB swap './make-swap.sh create 500M'\nIf you don't know what you are doing please see https://github.com/iOSMANzZz/i0-cloud-vm-updater/"

case $1 in
create)
volume=$2
filename=$3
volume_value=${volume%?}
volume_var=${volume: -1}
#test volume variable
if [ -z "$2" ]; then
  echo "Please specify a volume for swap file"
  echo -e $usage_error
  exit 1
elif [ "$volume_var" = "M" ] || [ "$volume_var" = "G" ]; then
#let go the script
  echo "    Volume variables checked"
else
  echo -e "Please use: \n           M for megabytes\n           G for gigabytes"
  echo -e $usage_error
  exit 1
fi

#test filename variable
if [ -z "$3" ]; then
filename="swapi0"
fi

#script 
sudo fallocate -l $volume /$filename
sudo chmod 600 /$filename
sudo mkswap /$filename
sudo swapon /$filename
relative_extension=$(date '+%Y%m%d%H%M')
sudo cp /etc/fstab /etc/fstab.$relative_extension.bak
echo '/'$filename' none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
echo 'vm.swappiness = 10' | sudo tee -a /etc/sysctl.conf
echo 'vm.vfs_cache_pressure = 50' | sudo tee -a /etc/sysctl.conf
sudo swapon --show

;;
*)
echo -e $usage_error
exit 1
;;
esac
