#!/bin/bash
set -e
logo(){
	clear
	cat << "EOF"
______      ___________      
___  /_________  /__  /_____ 
__  __ \  _ \_  /__  /_  __ \
_  / / /  __/  / _  / / /_/ /
/_/ /_/\___//_/  /_/  \____/ 
                             
                 _____       
_______ ___________  /______ 
__  __ `__ \  __ \  __/  __ \
_  / / / / / /_/ / /_ / /_/ /
/_/ /_/ /_/\____/\__/ \____/ 
                             

 By Broly @Broly_1

EOF
}
flashall(){
	logo
	fastboot flash dtbo dtbo.img
	logo
	fastboot flash vendor_boot vendor_boot.img
	logo
	fastboot flash boot boot.img
	logo
	fastboot reboot fastboot
	logo
	fastboot flash system system.img
	logo
	fastboot flash system_ext system_ext.img
	logo
	fastboot flash product product.img
	logo
	fastboot flash vbmeta vbmeta.img
	logo
	fastboot flash vbmeta_system vbmeta_system.img
	logo
	fastboot flash vendor vendor.img
	logo
	printf "Factory reset if you want clean install!"

}
logo
while true; do
	read -r -p "$(printf %s "Do you want to flash this Rom (y/n)? ")" yn
	case $yn in
		[Yy]* ) flashall; break;;
		[Nn]* ) exit;;
		* ) printf "Please answer yes or no.\n";;
	esac
done
