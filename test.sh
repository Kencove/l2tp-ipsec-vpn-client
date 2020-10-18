#!/bin/sh

while [ 80 -le 101 ]; do
  sleep 60s
  /bin/ping -c 3 $VPN_CHECK_IP > /dev/null
  if [[ $? != 0 ]]; then
    echo Can\'t reach remote host, exiting...
    break;
  fi
done 

