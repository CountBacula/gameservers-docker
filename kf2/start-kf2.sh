#!/bin/bash

if [ -z $SERVER_TOKEN ]
then
   echo "Warning: No server token supplied" >&2
fi

if [[ $SV_DOWNLOADURL -eq "auto" ]]
then
	INTERFACE=$(ip route | grep default | awk '{print $(NF)}')
	IPADDR=$(ip addr list dev $INTERFACE | grep 'inet ' | egrep -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
	SV_DOWNLOADURL="http://$IPADDR/"

fi

[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"

[[ -z "$MAP" ]] && MAP="KF-Bioticslab"
MAP="+map $MAP"

[[ -n $MAXPLAYERS ]] &&  MAXPLAYERS="-maxplayers $MAXPLAYERS"
[[ -n $MAPCYCLEFILE ]] && MAPCYCLEFILE="+mapcyclefile $MAPCYCLEFILE"
# Config file
