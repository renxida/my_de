#!/bin/bash

iwconfig wlp3s0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlp3s0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlp3s0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 10`

case $bars in
  0)  bar="__________" ;;
  1)  bar="X_________" ;;
  2)  bar="XX________" ;;
  3)  bar="XXX_______" ;;
  4)  bar="XXXX______" ;;
  5)  bar="XXXXX_____" ;;
  6)  bar="XXXXXX____" ;;
  7)  bar="XXXXXXX___" ;;
  8)  bar="XXXXXXXX__" ;;
  9)  bar="XXXXXXXXX_" ;;
  10) bar="XXXXXXXXXX" ;;
  *)  bar="____!!____" ;;
esac

echo -e $essid $bar

exit 0
