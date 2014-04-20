#!/system/bin/sh

id
mkdir /sdcard/backup
echo aboot backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=/sdcard/backup/aboot.bin
echo boot backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=/sdcard/backup/boot.bin
echo recovery backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/recovery of=/sdcard/backup/recobery.bin

echo DDR backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/DDR of=/sdcard/backup/DDR.bin
#echo OneSeg backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/OneSeg of=/sdcard/backup/OneSeg.bin
echo dbi backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/dbi of=/sdcard/backup/dbi.bin
echo dbibak backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/dbibak of=/sdcard/backup/dbibak.bin
echo drm backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/drm of=/sdcard/backup/drm.bin
echo encrypt backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/encrypt of=/sdcard/backup/encrypt.bin
echo felica backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/felica of=/sdcard/backup/felica.bin
echo fota backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/fota of=/sdcard/backup/fota.bin
echo fsc backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/fsc of=/sdcard/backup/fsc.bin
echo fsg backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/fsg of=/sdcard/backup/fsg.bin
echo grow backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/grow of=/sdcard/backup/grow.bin
echo laf backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/laf of=/sdcard/backup/laf.bin
echo misc backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/misc of=/sdcard/backup/misc.bin
echo modem backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/modem of=/sdcard/backup/modem.bin
echo modemst1 backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/modemst1 of=/sdcard/backup/modemst1.bin
echo modemst2 backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/modemst2 of=/sdcard/backup/modemst2.bin
echo mpt backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/mpt of=/sdcard/backup/mpt.bin
echo pad backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/pad of=/sdcard/backup/pad.bin
echo pad1 backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/pad1 of=/sdcard/backup/pad1.bin
echo pad2 backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/pad2 of=/sdcard/backup/pad2.bin
echo persist backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/persist of=/sdcard/backup/persist.bin
echo rct backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/rct of=/sdcard/backup/rct.bin
echo rpm backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/rpm of=/sdcard/backup/rpm.bin
echo rpmbak backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/rpmbak of=/sdcard/backup/rpmbak.bin
echo sbl1 backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/sbl1 of=/sdcard/backup/sbl1.bin
echo seclog backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/seclog of=/sdcard/backup/seclog.bin
echo sns backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/sns of=/sdcard/backup/sns.bin
echo spare backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/spare of=/sdcard/backup/spare.bin
echo ssd backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/ssd of=/sdcard/backup/ssd.bin
echo tombstones backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/tombstones of=/sdcard/backup/tombstones.bin
echo tz backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/tz of=/sdcard/backup/tz.bin
echo tzbak backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/tzbak of=/sdcard/backup/tzbak.bin
echo system backup; dd if=/dev/block/platform/msm_sdcc.1/by-name/system of=/sdcard/backup/system.bin


