#!/bin/bash

RESETHOUR="6"
resetWifi()
{
  echo "shuting down wifi...in 5 seconds"
  sleep 5s
  sudo ip link set wlan0 down
  sleep 10s
  echo "turning on wifi..."
  sudo ip link set wlan0 up

}

checkResetHour()
{

  # append a 0 if the reset hour has only one digit to match the date command output
  len=${#RESETHOUR}
  if [ $len == 1 ]; then
    RESETHOUR="0$RESETHOUR"
  fi

}

checkResetHour
while true; do
  hour=`date +%I`
  echo "current time hour is $hour"
  if [ "$hour" == "$RESETHOUR" ]; then
    echo "The time is right $RESETHOUR, resetting WIFI now"

    resetWifi
  else
    echo "not good time, sleeping and waiting for good time to reset:$RESETHOUR"
  fi
  echo sleeping ...
  sleep 1h
done
