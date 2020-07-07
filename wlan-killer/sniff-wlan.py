#!/usr/bin/env python3

from scapy.all import *

interface = "wlan0mon"
observedclients = []

print("opening database")
f = open("manuf","r")
print("reading database")
ouidb = f.readlines()
f.close()
print("closed database")

def search(addr):
	# loop over open file search for mac
	# print first 3 segments of mac addr
	oui = addr.split(":")
	mac = "%s:%s:%s" % (oui[0],oui[1],oui[2])
	for line in ouidb:
		ouimac = line.split("\t")
		if(ouimac[0] == mac):
			print("%s - %s - %s" % (ouimac[0], mac, ouimac[2].strip()))
		else:
			print("UNKNOW - %s" % (mac))

def sniffmgmt(p):
    stamgmtstypes = (0,2,4)
    if p.haslayer(Dot11):
            if p.type == 0 and p.subtype in stamgmtstypes:
                if p.addr2 not in observedclients:
                        search(p.addr2.upper())
						print(p.addr2.upper())
                        observedclients.append(p.addr2)
sniff(iface=interface,prn=sniffmgmt, store=0)
