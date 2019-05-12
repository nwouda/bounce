#!/usr/bin/env bash
tput clear; 
lines=$(($(tput lines)-1))
cols=$(($(tput cols)-4))
x=$((RANDOM%$cols))
y=$((RANDOM%$lines))
colorcount=$(($(tput colors)-1))
color=$((RANDOM%$colorcount))
xmode="inc"
ymode="inc"
while :; do
  tput cup $y $x
  tput setaf $color
  printf ████
  if [ $xmode == "inc" ]; then
    if [ $x -lt $cols ]; then
      x=$(($x+1))
    else
      xmode="dec"
      x=$(($x-1))
      color=$((RANDOM%$colorcount))
    fi
  elif [ $xmode == "dec" ]; then
    if [ $x -gt 0 ]; then
      x=$(($x-1))
    else
      xmode="inc"
      x=$(($x+1))
      color=$((RANDOM%$colorcount))
    fi
  fi

  if [ $ymode == "inc" ]; then
    if [ $y -lt $lines ]; then
      y=$(($y+1))
    else
      ymode="dec"
      y=$(($y-1))
      color=$((RANDOM%$colorcount))
    fi
  elif [ $ymode == "dec" ]; then
    if [ $y -gt 0 ]; then
      y=$(($y-1))
    else
      ymode="inc"
      y=$(($y+1))
      x=$(($x+RANDOM%2))
      color=$((RANDOM%$colorcount+1))
    fi
  fi
  lines=$(tput lines) 
  lines=$(($lines-1))
  cols=$(tput cols)
  cols=$(($cols-4))
done
