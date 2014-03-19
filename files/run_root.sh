#!/system/bin/sh
export C=/data/local/tmp

export bb="$C/busybox_file"

get_uid()
{
	$bb id | $bb grep -o -e uid=[0-9]* | $bb cut -d '=' -f2
}

if [ -f /system/xbin/su ] ; then
	/system/xbin/su
	if [ `get_uid` eq 0 ] ; then
		$1
		exit 0
	fi
fi
cd $C
./get_essential_address
./unlock_security_module
./run_root_shell -c $1
