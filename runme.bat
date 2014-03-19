@echo off
SET adb="%~dp0bin\adb.exe"
type "%~dp0doc\01_Thanks.txt"
pause

call :adb_push


type "%~dp0doc\03_warning.txt"
set /P INPUT=(N/y):  
if "%INPUT%"=="Y" call :install_recovery
if "%INPUT%"=="y" call :install_recovery
goto finish

type "%~dp0doc\04_warning_su.txt"
set /P INPUT=(N/y):  
if "%INPUT%" == "Y" call :install_su
if "%INPUT%" == "y" call :install_su

:finish
call :clean
type "%~dp0doc\02_End.txt"
pause
exit /b


:adb_push
%adb% push "%~dp0files" /data/local/tmp/
%adb% shell chmod 755 /data/local/tmp/busybox_file
:: rooting
%adb% shell chmod 755 /data/local/tmp/get_essential_address
%adb% shell chmod 755 /data/local/tmp/unlock_security_module
%adb% shell chmod 755 /data/local/tmp/run_root_shell
%adb% shell chmod 755 /data/local/tmp/run_root.sh
:: loki
%adb% shell chmod 755 /data/local/tmp/loki/loki.sh
%adb% shell chmod 755 /data/local/tmp/loki/loki_flash
%adb% shell chmod 755 /data/local/tmp/loki/loki_patch
%adb% shell chmod 755 /data/local/tmp/SuperSu/install_su.sh

exit /b

:install_recovery
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/loki/loki.sh
%adb% pull /sdcard/recovery_org.img

exit /b

:install_su
cls
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/SuperSu/install_su.sh
%adb% shell /data/local/tmp/run_root_shell -c "reboot recovery"
type "%~dp0doc\05_reboot.txt"
%adb% wait-for-device
exit /b

:clean
%adb% shell rm /data/local/tmp/busybox_file
%adb% shell rm /data/local/tmp/device.db
%adb% shell rm /data/local/tmp/get_essential_address
%adb% shell rm /data/local/tmp/run_root.sh
%adb% shell rm /data/local/tmp/run_root_shell
%adb% shell rm /data/local/tmp/unlock_security_module

%adb% shell rm -rf /data/local/tmp/loki
%adb% shell rm -rf /data/local/tmp/recovery
%adb% shell rm -rf /data/local/tmp/SuperSu
exit /b
