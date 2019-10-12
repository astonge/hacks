#!/usr/bin/env bash

echo "downloading.."
wget http://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz
wget http://www.ipdeny.com/ipv6/ipaddresses/blocks/ipv6-all-zones.tar.gz

echo "uncompressing.."
mkdir -p all;tar xzf all-zones.tar.gz -C all/
mkdir -p ipv6-all;tar xzf ipv6-all-zones.tar.gz -C ipv6-all
