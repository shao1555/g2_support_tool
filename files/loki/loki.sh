#!/system/bin/sh
#
# This leverages the loki_patch utility created by djrbliss which allows us
# to bypass the bootloader checks on jfltevzw and jflteatt
# See here for more information on loki: https://github.com/djrbliss/loki
#

export C=/data/local/tmp/loki
bb="$C/busybox_file"

recovery_img=/data/local/tmp/recovery/`ls /data/local/tmp/recovery`
if [ ! -f "$recovery_img" ] ; then
   exit 1
fi

mkdir -p $C
dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=$C/aboot.img
$C/loki_tool patch recovery $C/aboot.img $recovery_img $C/recovery.lok || exit 1
$C/loki_tool flash recovery $C/recovery.lok || exit 1
exit 0

