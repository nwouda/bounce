#!/usr/bin/env bash
tput clear; 
lines=$(tput lines) 
lines=$(($lines-1))
cols=$(tput cols)
x=0
y=0
cursorz="😄 😃 😀 😊 ☺ 😉 😍 😘 😚 😗 😙 😜 😝 😛 😳 😁 😔 😌 😒 😞 😣 😢 😂 😭 😪 😥 😰 😅 😓 😩 😫 😨 😱 😠 😡 😤 😖 😆 😋 😷 😎 😴 😵 😲 😟 😦 😧 😈 👿 😮 😬 😐 😕 😯 😶 😇 😏 😑 👲 👳 👮 👷 💂 👶 👦 👧 👨 👩 👴 👵 👱 👼 👸"
IFS=' '
cursors=($cursorz)
num_cursors=${#cursors[*]}
cursor=${cursors[$((RANDOM%num_cursors))]}
xmode=inc
ymode=inc
while :;
do
tput cup	$y $x
printf $cursor
if [ $xmode == inc ]
	then
	if [ $x -lt $cols ]
		then
		x=$(($x+1))
		else
		xmode=dec
		x=$(($x-1))
		cursor=${cursors[$((RANDOM%num_cursors))]}
printf 
	fi
elif [ $xmode == dec ]
	then
	if [ $x -gt 0 ]
		then
		x=$(($x-1))
		else
		xmode=inc
		x=$(($x+1))
		cursor=${cursors[$((RANDOM%num_cursors))]}
printf 
	fi
fi

if [ $ymode == inc ]
	then
	if [ $y -lt $lines ]
		then
		y=$(($y+1))
		else
		ymode=dec
		y=$(($y-1))
		cursor=${cursors[$((RANDOM%num_cursors))]}
printf 
	fi
elif [ $ymode == dec ]
	then
	if [ $y -gt 0 ]
		then
		y=$(($y-1))
		else
		ymode=inc
		y=$(($y+1))
		cursor=${cursors[$((RANDOM%num_cursors))]}
printf 
	fi
fi
lines=$(tput lines) 
lines=$(($lines-1))
cols=$(tput cols)
sleep 0.02
done
