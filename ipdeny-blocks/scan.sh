#!/usr/bin/env bash

if [ -z $1 ]
then
	echo "need ip block list file"
	exit 1
fi

TODAY=`date +"%F-%H-%M-%S"`
CMDOPT="-p1177,80,8080,16471 --rate 25 --banners -oL $TODAY-scan"

while read ipblock
do
	sudo /usr/bin/masscan $CMDOPT $ipblock
	sleep 10
done < $1
