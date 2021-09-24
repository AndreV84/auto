#!/bin/bash
echo Enter Serial number of the unit, please and press enter && read SN && echo $SN >SN \n 
echo You entered serial number as  $SN. 
echo The Wireless connection name will be created as 
export SSID=cortexia.$(date +%d.%m.%Y).$SN
echo $SSID
if [ ! -e /etc/NetworkManager/system-connections/$SSID ]
then
     nmcli connection add type wifi ifname wlan0 con-name $SSID autoconnect no ssid $SSID mode ap
     nmcli connection modify $SSID 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
fi
     ifconfig wlan0 down
ifconfig wlan0 up
nmcli connection up $SSID
ifconfig wlan0 10.42.0.1
