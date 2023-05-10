@echo off
title PE flasher 

ECHO PixelExperience installer by Broly

fastboot flash dtbo dtbo.img
fastboot flash vendor_boot vendor_boot.img
fastboot flash boot boot.img
fastboot reboot fastboot
fastboot flash system system.img
fastboot flash system_ext system_ext.img
fastboot flash product product.img
fastboot flash vbmeta vbmeta.img
fastboot flash vbmeta_system vbmeta_system.img
fastboot flash vendor vendor.img
CHOICE /C YN /M "Do you whant to wipe data?"
IF %ERRORLEVEL% EQU 1 fastboot -w
fastboot reboot
IF %ERRORLEVEL% EQU 2 
ECHO Dirty flashing doesn't always work factory reset if you get stuck, trying to boot system...
fastboot reboot
pause
