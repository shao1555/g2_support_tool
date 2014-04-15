#!/system/bin/sh

bb=/data/local/tmp/busybox_file
echo mount rw
$bb mount -o remount,rw /system

if [ ! -f /sdcard/ccs-auditd_org ] ; then
  $bb cp /system/bin/ccs-auditd /sdcard/ccs-auditd_org
fi
$bb rm /system/bin/ccs-auditd
$bb cp /data/local/tmp/unlock_security_module /system/bin/unlock_security_module
$bb cp /data/local/tmp/device.db /system/etc/device.db
$bb cp /data/local/tmp/SuperSu/ccs-auditd /system/bin/ccs-auditd
chmod 755 /system/bin/unlock_security_module
chmod 755 /system/bin/ccs-auditd

$bb mount -o remount,ro /system


echo 'mount("/data");' > /cache/recovery/extendedcommand
echo 'install_zip("/data/local/tmp/SuperSu/UPDATE-SuperSU-v1.93.zip");' >> /cache/recovery/extendedcommand

