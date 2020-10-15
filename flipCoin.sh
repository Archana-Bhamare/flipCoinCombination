#!/bin/bash -x
random=$((RANDOM%2))
if [ $random -eq 0 ]
then
	echo "Head"
else
	echo "Tail"
fi
echo "---Singlet Combination---"
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
echo "---Doublet Combination---"
declare -A flipcoin
coin=2
H=0
T=0
for ((i=1;i<=5;i++))
do
	word=""
	for ((j=0;j<$coin;j++))
	do
		random=$((RANDOM%2))
		if [  $random -eq 1 ]
		then
			word=$word"H"
		else
			word=$word"T"
		fi
	done
	echo "Flip coin : $word"
	flipcoin[$word]=$(( ${flipcoin[$word]} + 1 ))
done
echo "Key: ${!flipcoin[@]}"
echo "Number of occurences : ${flipcoin[@]}"
percentage=`echo ${flipcoin[@]} | awk '{print ($1/5)*100}'` 
echo ${!flipcoin[@]} | awk '{print $1}'
echo "$percentage%"
percentage2=`echo ${flipcoin[@]} | awk '{print ($2/5)*100}'`
echo ${!flipcoin[@]} | awk '{print $2}'
echo "$percentage2%"
percentage3=`echo ${flipcoin[@]} | awk '{print ($3/5)*100}'`
echo ${!flipcoin[@]} | awk '{print $3}'
echo "$percentage3%"
percentage4=`echo ${flipcoin[@]} | awk '{print ($4/5)*100}'`
echo ${!flipcoin[@]} | awk '{print $4}'
echo "$percentage4%"