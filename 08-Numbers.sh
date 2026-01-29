#!/bin/bash

NUM1=$1
NUM2=$2

echo "The sum of $NUM1 + $NUM2 is: $((NUM1+NUM2))"

NAMES=("Mani" "Kanta" "Reddy")

echo "Name are: ${NAMES[@]}"
echo "First Name is: ${NAMES[0]}"
echo "Last Name is: ${NAMES[2]}"