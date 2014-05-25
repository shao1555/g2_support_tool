if hash adb 2>/dev/null; then
    # adb がある場合
    echo "adb found."

else
    # adb がない場合
    echo "adb not found. please install it then run again."
    exit 1
fi

if adb shell id 1>/dev/null 2>/dev/null; then
    # adb がある場合
    echo "device detected."
else
    # adb がない場合
    cat doc/en/09_Error_device_not_found.txt
    exit 1
fi

# push files
adb push files/tmproot /data/local/tmp/
adb shell chmod 755 /data/local/tmp/busybox_file
adb shell chmod 755 /data/local/tmp/get_essential_address
adb shell chmod 755 /data/local/tmp/unlock_security_module
adb shell chmod 755 /data/local/tmp/run_root_shell
adb shell chmod 755 /data/local/tmp/run_root.sh

# backup
adb push files/backup /data/local/tmp/
adb shell chmod 755 /data/local/tmp/backup.sh
adb shell /data/local/tmp/run_root.sh /data/local/tmp/backup.sh
mkdir -p backups
adb pull /sdcard/backup/ backups/

# install recovery
adb shell mkdir -p /data/local/tmp/recovery
adb shell mkdir -p /data/local/tmp/loki
adb push files/recovery /data/local/tmp/recovery
adb push files/loki /data/local/tmp/loki

# loki
adb shell chmod 755 /data/local/tmp/loki/loki.sh
adb shell chmod 755 /data/local/tmp/loki/loki_tool
adb shell /data/local/tmp/run_root.sh /data/local/tmp/loki/loki.sh

# su
adb shell mkdir -p /data/local/tmp/SuperSu
adb push files/SuperSu /data/local/tmp/SuperSu
adb shell chmod 755 /data/local/tmp/SuperSu/install_su.sh
adb shell chmod 755 /data/local/tmp/SuperSu/install-busybox.sh
adb shell /data/local/tmp/run_root_shell -c "chmod 6755 /data/local/tmp/SuperSu/sed/xbin/daemonsu"
adb shell /data/local/tmp/run_root.sh /data/local/tmp/SuperSu/install_su.sh
adb install files/SuperSu_forHost/eu.chainfire.supersu-193.apk
adb shell /data/local/tmp/run_root_shell -c "reboot recovery"

