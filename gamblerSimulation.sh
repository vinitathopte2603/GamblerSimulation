#!/bin/bash -x

var="Welcome to Gambler Simulation"
echo "$var"

INITIAL_STAKE=100;
DAY=1;
BET=1;
WIN=1;
LOSS=0;
finalStake=INITIAL_STAKE;

function Gamble(){

	randomCheck=$((RAMDOM%2))
	if [[ $randomCheck -eq $1 ]]
	then
		finalStake=$(( $finalStake + 1 ))
		return $finalStake
	else
		finalStake=$(( $finalStake - 1 ))
		return $finalStake
	fi
}

Gamble $(($WIN))
echo "$WIN"
