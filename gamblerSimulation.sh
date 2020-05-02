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
finalStake=$INITIAL_STAKE;
winningCondition=$(( $INITIAL_STAKE + $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))
loosingCondition=$(( $INITIAL_STAKE - $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))


function Gamble(){
	for (( dayCount=1; dayCount<DAYS; dayCount++ ))
	do
		finalStake=$INITIAL_STAKE;
	while [ $finalStake -lt $winningCondition ] && [ $finalStake -gt $loosingCondition ]
	do
 		randomCheck=$(( RANDOM % 2 ))

		if [[ $randomCheck -eq $1 ]]
		then
			finalStake=$(( $finalStake + 1 ))
		else
			finalStake=$(( $finalStake - 1 ))

		fi
	done
	totalAmount=$(( $finalStake - $INITIAL_STAKE ))
	totalGamblerAmount=$(( $TotalGamblerAmount + $totalAmount ))
	done
	echo "Gambler resigned for the day"
}

Gamble $(($WIN))

