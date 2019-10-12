#!/usr/bin/env bash

while read ipblock
do
	echo $ipblock
	sleep 10
done < $1
