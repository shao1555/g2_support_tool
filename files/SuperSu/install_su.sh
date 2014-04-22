#!/system/bin/sh
bb=/data/local/tmp/busybox_file
echo mount rw
$bb mount -o remount,rw /system
mount | grep system
echo backup css-auditd
if [ ! -f /sdcard/ccs-auditd_org ] ; then
  $bb cp /system/bin/ccs-auditd /sdcard/ccs-auditd_org
fi
$bb rm /system/bin/ccs-auditd
$bb cp /data/local/tmp/unlock_security_module /system/bin/unlock_security_module
$bb cp /data/local/tmp/device.db /system/etc/device.db
chmod 755 /system/bin/unlock_security_module

#supersu
$bb cp /data/local/tmp/SuperSu/ccs-auditd /system/bin/ccs-auditd
$bb cp /data/local/tmp/SuperSu/su /system/xbin/su
$bb chown 0.0 /system/bin/ccs-auditd
$bb chmod 755 /system/bin/ccs-auditd


#install busybox
echo install busybox
/data/local/tmp/SuperSu/install-busybox.sh

echo mount ro
$bb mount -o remount,ro /system

echo 'ui_print("Start Rooting");' > /cache/recovery/extendedcommand
echo 'mount("/system");' >> /cache/recovery/extendedcommand
echo 'ui_print("/system/bin/chmod 6755 /system/xbin/su");' >> /cache/recovery/extendedcommand
echo 'run_program("/system/bin/chmod", "6755", "/system/xbin/su");' >> /cache/recovery/extendedcommand


