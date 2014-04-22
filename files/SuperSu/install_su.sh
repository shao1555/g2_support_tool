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
chmod 755 /system/bin/unlock_security_module

$bb mkdir -p /system/addon.d
#supersu
$bb cp /data/local/tmp/SuperSu/sed/addon.d/99-supersu.sh /system/addon.d/99-supersu.sh  
$bb cp /data/local/tmp/SuperSu/sed/bin/.ext/.su /system/bin/.ext/.su    
$bb cp /data/local/tmp/SuperSu/sed/bin/ccs-auditd /system/bin/ccs-auditd    
$bb cp /data/local/tmp/SuperSu/sed/etc/init.d/99SuperSUDaemon /system/etc/init.d/99SuperSUDaemon
$bb cp /data/local/tmp/SuperSu/sed/etc/.installed_su_daemon /system/etc/.installed_su_daemon 
$bb cp /data/local/tmp/SuperSu/sed/etc/install-recovery.sh /system/etc/install-recovery.sh  
$bb cp /data/local/tmp/SuperSu/sed/etc/install-busybox.sh /system/etc/install-busybox.sh  
$bb cp /data/local/tmp/SuperSu/sed/xbin/daemonsu /system/xbin/daemonsu    
$bb cp /system/xbin/daemonsu /system/xbin/su

$bb chown 0.0 /system/addon.d/99-supersu.sh
$bb chown 0.0 /system/bin/.ext/.su
$bb chown 0.0 /system/bin/ccs-auditd
$bb chown 0.0 /system/etc/init.d/99SuperSUDaemon
$bb chown 0.0 /system/etc/.installed_su_daemon
$bb chown 0.0 /system/etc/install-recovery.sh
$bb chown 0.0 /system/etc/install-busybox.sh
$bb chown 0.0 /system/xbin/daemonsu
$bb chown 0.0 /system/xbin/su

$bb chmod 755 /system/addon.d/99-supersu.sh
$bb chmod 755 /system/bin/.ext/.su
$bb chmod 755 /system/bin/ccs-auditd
$bb chmod 755 /system/etc/init.d/99SuperSUDaemon
$bb chmod 644 /system/etc/.installed_su_daemon 
$bb chmod 755 /system/etc/install-recovery.sh 
$bb chmod 755 /system/etc/install-busybox.sh 
$bb chmod 755 /system/xbin/daemonsu
$bb chmod 755 /system/xbin/su

#install busybox
/data/local/tmp/SuperSu/install-busybox.sh

$bb mount -o remount,ro /system
