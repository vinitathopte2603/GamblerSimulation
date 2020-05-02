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
declare -A gamblerSimulator
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
	dailyAmount=$(( $finalStake - $INITIAL_STAKE ))
	finalDailyAmount=$(( $finalDailyAmount + $dailyAmount ))
	gambledAmount[$dayCount]=$dailyAmount
	gamblerSimulator[$dayCount]=$finalDailyAmount
	totalGamblerAmount=$(( $TotalGamblerAmount + $dailyAmount ))
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
		luckiestValue=$( printf "%s\n" ${gamblerSimulator[@]} | sort -nr | head -1 )
		unluckiestValue=$( printf "%s\n" ${gamblerSimulator[@]} sort -nr | tail -1 )

		findLuckiestOrUnluckiestDay $luckiestValue $unluckiestValue
}
function findLuckiestOrUnluckiestDay(){
	for data in "${!gamblerSimulator[@]}"
	do
		if [[ ${gamblerSimulator[$data]} -eq $1 ]]
		then
			echo "Lucky Day" $data
		elif [[ ${gamblerSimulator[$data]} -eq $2 ]]
		then
			echo "Unlucky Day" $data
		fi
	done
}

Gamble $(($WIN))

