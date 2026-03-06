#!/bin/bash

ones_place()
{
    declare -i a1=$(shuf -i 1-9 -n 1)
    declare -i a2=$(shuf -i 1-9 -n 1)
    declare -i a3=$(shuf -i 1-9 -n 1)
    declare -i a4=$(shuf -i 1-9 -n 1)
    declare -i sum=a1+a2+a3+a4
    printf "%2s + %2s + %2s + %2s = %2s\n" \
        ${a1} ${a2} ${a3} ${a4} $sum
    printf "%s\n" "----------------------------"
}


ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place
ones_place