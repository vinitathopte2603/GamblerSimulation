#!/bin/bash -x

var="Welcome to Gambler Simulation"
echo "$var"

INITIAL_STAKE=100;
DAY=1;
BET=1;
WIN=1;
LOSS=0;
PERCENTAGE_STAKE=50;
DAYS=20;
winCount=0;
lossCount=0;
winTotalAmount=0;
lossTotalAmount=0;
finalStake=$INITIAL_STAKE;
winningCondition=$(( $INITIAL_STAKE + $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))
loosingCondition=$(( $INITIAL_STAKE - $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))

declare -A gambledAmount

function Gamble(){
	for (( dayCount=1; dayCount<DAYS; dayCount++ ))
	do
		finalStake=$INITIAL_STAKE;
	while [ $finalStake -lt $winningCondition ] && [ $finalStake -gt $loosingCondition ]
	do
 		randomCheck=$(( RANDOM % 2 ))

		if [[ $randomCheck -eq $1 ]]
		then
			finalStake=$(( $finalStake + $BET ))
		else
			finalStake=$(( $finalStake - $BET ))

		fi
	done
	totalAmount=$(( $finalStake - $INITIAL_STAKE ))
	gambledAmount[$dayCount]=$totalAmount
	totalGamblerAmount=$(( $TotalGamblerAmount + $totalAmount ))
	done
	echo "Gambler resigned for the day"

	for data in "${!gambledAmount[@]}"
	do
		if [[ ${gambledAmount[$data]} -lt $LOSS ]]
		then
			lossCount=$(( $lossCount + 1 ))
			lossTotalAmount=$(( $lossTotalAmount + ${gambledAmount[$data]} ))
		else
			winCount=$(( $winCount + 1 ))
			winTotalAmount=$(( $winTotalAmount + ${gambledAmount[$data]} ))
		fi
	done
}

Gamble $(($WIN))

