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
	./fastboot getvar max-sparse-size 
	logo
	./fastboot oem fb_mode_set 
	logo
	./fastboot flash --slot=all partition gpt.bin 
	logo
	./fastboot flash --slot=all bootloader bootloader.img 
	logo
	./fastboot flash --slot=all vbmeta vbmeta.img 
	logo
	./fastboot flash --slot=all vbmeta_system vbmeta_system.img 
	logo
	./fastboot flash --slot=all radio radio.img 
	logo
	./fastboot flash --slot=all bluetooth BTFM.bin 
	logo
	./fastboot flash --slot=all dsp dspso.bin 
	logo
	./fastboot flash --slot=all spunvm spunvm.bin 
	logo
	./fastboot flash --slot=all logo logo.bin 
	logo
	./fastboot flash --slot=all boot boot.img 
	logo
	./fastboot flash --slot=all vendor_boot vendor_boot.img 
	logo
	./fastboot flash --slot=all dtbo dtbo.img 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.0 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.1 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.2 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.3 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.4 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.5 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.6 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.7 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.8 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.9 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.10 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.11 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.12 
	logo
	./fastboot flash --slot=all super super.img_sparsechunk.13 
	logoflash pe/
	./fastboot erase carrier 
	logo
	./fastboot erase userdata 
	logo
	./fastboot erase metadata 
	logo
	./fastboot erase ddr 
	logo
	./fastboot flash --slot=all bluetooth BTFM.bin 
	logo
	./fastboot oem fb_mode_clear
	./fastboot reboot bootloader 
	logo
	printf "\n"
	printf "flashing PixelExperience Rom"
	./fastboot flash dtbo pe-dtbo.img
	logo
	./fastboot flash vendor_boot pe-vendor_boot.img
	logo
	./fastboot flash boot pe-boot.img
	logo
	./fastboot reboot fastboot
	logo
	./fastboot flash system system.img
	logo
	./fastboot flash system_ext system_ext.img
	logo
	./fastboot flash product product.img
	logo
	./fastboot flash vbmeta pe-vbmeta.img
	logo
	./fastboot flash vbmeta_system pe-vbmeta_system.img
	logo
	./fastboot flash vendor vendor.img
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
