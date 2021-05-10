# Ugrade your old VM image to the latest version
Azure VM do not serve latest Ubuntu version. So lets update it as fast as possible.

## Usage
After Ubuntu 16 installation is completed on Microsoft Azure, start an SSH connection to your virtual machine and download the scripts using the command below.

    git clone https://github.com/iosmand/upgrade.git && chmod +x upgrade/azure/ubuntu/*.sh upgrade/azure/ubuntu/*.py
go to de directory

    cd upgrade/azure/ubuntu/
Start the very first script

    bash upgrade-16-18.sh first

After reboot

    bash upgrade-16-18.sh second
    
After reboot you are on Ubuntu 18

    bash upgrade-18-20.sh first
    
After reboot 

    bash upgrade-18-20.sh second

Optionally you can create swap file by using script below. If you have 1GB or less, the recommended swap amount is more than double your RAM. If your RAM is more than 1GB, the recommended swap amount is as much or more than your RAM.
    
`bash make-swap.sh {amount in G or M} {optional swap file name}`
    
Example usage:

    bash make-swap.sh 1000M
or

    bash make-swap.sh 4G verycustomswapfilename
