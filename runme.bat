@echo off
SET adb="%~dp0adb\adb.exe"
SET recoveryimg=LGL22-KK-KBC-CWM-v6.0.4.7_r1-recovery.img

type "%~dp0doc\01_Thanks.txt"
pause

call :adb_push


echo . 本ツール、recoveryを使用する事に起因する
echo . データ破損、機器破損については責任をもちません。
echo . 今ならまだ引き返せます
set /P INPUT=作業を継続しますか？(N/Y):  
if "%INPUT%"=="Y" call :install_recovery
if "%INPUT%"=="y" call :install_recovery


set /P INPUT=恒久Root(with SuperSu)を取得しますかぁ？(N/Y):  
if "%INPUT%" == "Y" call :iinstall_su
if "%INPUT%" == "y" call :iinstall_su

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
%adb% shell chmod 755 /data/local/tmp/loki.sh
%adb% shell chmod 755 /data/local/tmp/loki/loki_flash
%adb% shell chmod 755 /data/local/tmp/loki/loki_patch
%adb% shell chmod 755 /data/local/tmp/SuperSu/install_su.sh

exit /b

:install_recovery
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/loki/loki.sh
%adb% pull /sdcard/recovery_org.img

exit /b

:install_su
%adb% shell /data/local/tmp/run_root.sh /data/local/tmp/SuperSu/install_su.sh
%adb% shell /data/local/tmp/run_root_shell -c "reboot recovery"
echo 端末が再起動しますのでお待ちください
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
