#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 0 ]
    echo "$NUMBER is +ve number"
elif [ $NUMBER -lt 0 ]
    echo "$NUMBER is -ve number"
fi
    echo "$NUMBER is exactly equal's to ZERO"
    
# -gt -> greater than
# -lt -> less than
# -eq -> equal
# -ne -> not equal