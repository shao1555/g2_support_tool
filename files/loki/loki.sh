#!/system/bin/sh
#
# This leverages the loki_patch utility created by djrbliss which allows us
# to bypass the bootloader checks on jfltevzw and jflteatt
# See here for more information on loki: https://github.com/djrbliss/loki
#

export C=/data/local/tmp/
bb="$C/busybox_file"

if [ ! -f /sdcard/recovery_org.img ] ; then
  dd if=/dev/block/platform/msm_sdcc.1/by-name/recvery of=/sdcard/recovery_org.img
fi


mkdir -p $C
dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=$C/aboot.img
$C/loki_patch recovery $C/aboot.img $C/recovery.img $C/recovery.lok || exit 1
$C/loki_flash recovery $C/recovery.lok || exit 1
rm $C/aboot.img
rm $C/recovery.img
rm $C/recovery.lok
$C/loki_patch
$C/loki_flash
exit 0

