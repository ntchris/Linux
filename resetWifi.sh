#!/bin/bash
# run this script in raspberry pi zero W to automatically reset wifi twice a day in the reset hour
# reset wifi at 6AM and 6PM everyday.
RESETHOUR="06"
resetWifi()
{
  echo "shuting down wifi...in 5 seconds"
  sleep 5s
  sudo ip link set wlan0 down
  sleep 10s
  echo "turning on wifi..."
  sudo ip link set wlan0 up

}

while true; do
  hour=`date +%I`
  echo "current time hour is $hour"
  if [ "$hour" == "$RESETHOUR" ]; then
    echo "The time is right $RESETHOUR, resetting WIFI now"

    resetWifi
  else
    echo "not good time, sleeping and waiting for good time to reset:$RESETHOUR"
  fi
  sleep 1h
done

