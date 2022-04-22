app=0
mkdir -p $MODPATH/data/oplus/oppo
old_file=`find /data/oplus/oppo/darkmode -name "sys_dark_mode_third_app_managed.xml"`
cp $old_file $MODPATH/data/oplus/oppo
find $MODPATH/data/oplus/oppo -name "sys_dark_mode_third_app_managed.xml" -type f 2>/dev/null | while read file ;do
	for package in $(pm list package -a | cut -d: -f2) ;do
	sed -i "/<\/filter-conf>/i\<p attr=\"$package\"\/>" $file
	app=$(($app + 1))
	done && echo "－ 深色模式加入的App 有"$app"個"
done
