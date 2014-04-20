#!/system/bin/sh
export C=/data/local/tmp

export bb="$C/busybox_file"

get_uid()
{
	$bb id | $bb grep -o -e uid=[0-9]* | $bb cut -d '=' -f2
}

if [ -f /system/xbin/su ] ; then
	if [ `get_uid` eq 0 ] ; then
		/system/xbin/su -c "$1"
		exit 0
	fi
fi
cd $C
echo -----------------------------
echo get_essential_address
./get_essential_address
echo -----------------------------
echo unlock_security_module
./unlock_security_module
echo -----------------------------
echo run_root_shell
./run_root_shell -c $1
