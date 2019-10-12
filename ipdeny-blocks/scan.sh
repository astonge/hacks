#!/usr/bin/env bash

if [ -z $1 ]
then
	echo "need ip block list file"
	exit 1
fi

CMDOPT='-p1177 --rate 25'

while read ipblock
do
	sudo /usr/bin/masscan $CMDOPT $ipblock
	sleep 10
done < $1
