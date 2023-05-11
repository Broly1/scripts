echo off 
echo    ______      ___________      
echo    ___  /_________  /__  /_____ 
echo    __  __ \  _ \_  /__  /_  __ \
echo    _  / / /  __/  / _  / / /_/ /
echo    /_/ /_/\___//_/  /_/  \____/ 
echo.                                 
echo                     _____       
echo    _______ ___________  /______ 
echo    __  __ `__ \  __ \  __/  __ \
echo    _  / / / / / /_/ / /_ / /_/ /
echo    /_/ /_/ /_/\____/\__/ \____/ 
echo.
echo @Broly_1
echo.
CHOICE /C YN /M "Attention this script will erase all your data do you wish to continue?"
IF %ERRORLEVEL% EQU 2 exit
fastboot getvar max-sparse-size 
fastboot oem fb_mode_set 
fastboot flash --slot=all partition gpt.bin 
fastboot flash --slot=all bootloader bootloader.img 
fastboot flash --slot=all vbmeta vbmeta.img 
fastboot flash --slot=all vbmeta_system vbmeta_system.img 
fastboot flash --slot=all radio radio.img 
fastboot flash --slot=all bluetooth BTFM.bin 
fastboot flash --slot=all dsp dspso.bin 
fastboot flash --slot=all spunvm spunvm.bin 
fastboot flash --slot=all logo logo.bin 
fastboot flash --slot=all boot boot.img 
fastboot flash --slot=all vendor_boot vendor_boot.img 
fastboot flash --slot=all dtbo dtbo.img 
fastboot flash --slot=all super super.img_sparsechunk.0 
fastboot flash --slot=all super super.img_sparsechunk.1 
fastboot flash --slot=all super super.img_sparsechunk.2 
fastboot flash --slot=all super super.img_sparsechunk.3 
fastboot flash --slot=all super super.img_sparsechunk.4 
fastboot flash --slot=all super super.img_sparsechunk.5 
fastboot flash --slot=all super super.img_sparsechunk.6 
fastboot flash --slot=all super super.img_sparsechunk.7 
fastboot flash --slot=all super super.img_sparsechunk.8 
fastboot flash --slot=all super super.img_sparsechunk.9 
fastboot flash --slot=all super super.img_sparsechunk.10 
fastboot flash --slot=all super super.img_sparsechunk.11 
fastboot flash --slot=all super super.img_sparsechunk.12 
fastboot flash --slot=all super super.img_sparsechunk.13 
fastboot erase carrier 
fastboot erase userdata 
fastboot erase metadata 
fastboot erase ddr 
fastboot flash --slot=all bluetooth BTFM.bin 
fastboot oem fb_mode_clear
fastboot reboot bootloader 
echo.
echo flashing PixelExperience Rom
echo. 
fastboot flash dtbo pe-dtbo.img
fastboot flash vendor_boot pe-vendor_boot.img
fastboot flash boot pe-boot.img
fastboot reboot fastboot
fastboot flash dtbo pe-dtbo.img
fastboot flash vendor_boot pe-vendor_boot.img
fastboot flash boot pe-boot.img
fastboot flash system system.img
fastboot flash system_ext system_ext.img
fastboot flash product product.img
fastboot flash vbmeta pe-vbmeta.img
fastboot flash vbmeta_system pe-vbmeta_system.img
fastboot flash vendor vendor.img
echo PixelExperience installer by Broly
echo.
echo ------------------------------------------ 
echo Flashing done roll up and check for errors
echo ------------------------------------------ 
pause 
