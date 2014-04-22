@echo off
for /f "tokens=3 delims= " %%a in ('chcp') do set lang=%%a
if "%lang%" == "932" (set doc=%~dp0doc\jp) else (set doc=%~dp0doc\en)
SET adb=%~dp0bin\adb.exe

type "%doc%\01_Thanks.txt"
pause


call :adb_push


type "%doc%\06_backup.txt"
set /P INPUT=(N/y):  
if "%INPUT%" == "Y" call :backup
if "%INPUT%" == "y" call :backup


type "%doc%\03_warning.txt"
set /P INPUT=(N/y):  
if "%INPUT%"=="Y" call :install_recovery
if "%INPUT%"=="y" call :install_recovery

type "%doc%\04_warning_su.txt"
set /P INPUT=(N/y):  
if "%INPUT%" == "Y" call :install_su
if "%INPUT%" == "y" call :install_su

:finish
call :clean
type "%doc%\02_End.txt"
pause
exit /b


:adb_push
%adb% push "%~dp0files\tmproot" /data/local/tmp/
%adb% shell chmod 755 /data/local/tmp/busybox_file
:: rooting
%adb% shell chmod 755 /data/local/tmp/get_essential_address
%adb% shell chmod 755 /data/local/tmp/unlock_security_module
%adb% shell chmod 755 /data/local/tmp/run_root_shell
%adb% shell chmod 755 /data/local/tmp/run_root.sh



exit /b

:backup
echo prepear for backup
%adb% push "%~dp0files\backup" /data/local/tmp/
%adb% shell chmod 755 /data/local/tmp/backup.sh

echo start backup
type "%doc%\07_warning_backup.txt"
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/backup.sh
echo save to PC
mkdir %~dp0backups
adb pull /sdcard/backup/   "%~dp0backups"
exit /b


:install_recovery
echo prepear for install recovery
%adb% shell mkdir -p /data/local/tmp/recovery
%adb% shell mkdir -p /data/local/tmp/loki
%adb% push "%~dp0files\recovery" /data/local/tmp/recovery
%adb% push "%~dp0files\loki" /data/local/tmp/loki
:: loki
%adb% shell chmod 755 /data/local/tmp/loki/loki.sh
%adb% shell chmod 755 /data/local/tmp/loki/loki_tool


echo start instrall recovery
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/loki/loki.sh

exit /b

:install_su
cls
echo prepear for gettting the permanent root
%adb% shell mkdir -p /data/local/tmp/SuperSu
%adb% push "%~dp0files\SuperSu" /data/local/tmp/SuperSu
%adb% shell chmod 755 /data/local/tmp/SuperSu/install_su.sh



echo install su binaries
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/SuperSu/install_su.sh
%adb% shell /data/local/tmp/run_root_shell -c "reboot recovery"
type "%doc%\05_reboot.txt"
%adb% wait-for-device

echo start instrall SuperSu.apk
%adb% install "%~dp0files\SuperSu_forHost\eu.chainfire.supersu-193.apk"
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
