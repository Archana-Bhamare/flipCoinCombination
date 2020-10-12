#!/bin/bash -x

toss=$((RANDOM%2))
if [ $toss -eq 0 ]
then
	echo "Head wins"
else
	echo "Tail Wins"
fi