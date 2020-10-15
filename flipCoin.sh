#!/bin/bash -x
#"---Singlet Combination---"
head=0
count=0
declare -A coin
for ((i=0;i<5;i++))
do
	toss=$((RANDOM%2))
	if [ $toss -eq 0 ]
	then	
		echo "Head"
		((head++))
	else
		echo "Tail"
		((tail++))	
	fi
done
coin[head]=$head
coin[tail]=$tail
echo "${!coin[@]} : ${coin[@]}"
percentage=`echo $head | awk '{print ($1/5)*100}'`
echo "Percentage of Head : $percentage%"
percentage2=`echo $tail | awk '{print ($1/5)*100}'`
echo "Percentage of Tail : $percentage2%"
