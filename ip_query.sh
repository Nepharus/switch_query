#!/bin/bash
cwd=$(pwd)
rm $cwd/vlanlist
lynx -cmd_script=$cwd/lynxlog 205.118.117.194
txt1="vlaninfo.txt1"
for f in $(ls -altr $cwd/ | awk '/.txt/'); do
cat $f >> $txt1 2>/dev/null
done
mv $txt1 $cwd/vlanlist
txt1=vlanlist
for i in $(ls $cwd/ | awk '/.txt/'); do
rm -rf $i
done
echo $txt1
cat $txt1
