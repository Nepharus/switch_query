#!/bin/bash
cwd=$(pwd)
rm $cwd/vlanlist
count=36
ip="10.62.2.1"
baseaddr="$(echo $ip | cut -d. -f1-3)"
lso="$(echo $ip | cut -d. -f4)"

while [ $count -gt 0 ]
do
	ips=()
	ips+=( $baseaddr.$lso )
	for machine in ${ips[*]}; do
		curl -silent -F host=$machine 205.118.117.194/vlaninfo.php >> vlanlist
	done
	lso=$(( $lso + 1 ))
	count=$(( $count -1 ))
done