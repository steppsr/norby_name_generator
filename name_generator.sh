#!/bin/bash
# Names are going to be 4 alpha characters, a hyphen, then 4 digits.

# 1st param - number of names to generate
num=$1

for (( c=0; c<$num; c++ ))
do
   # let make sure each name is unique, so loop until we create a new one
   available=0
   until [[ "$available" -eq "1" ]]; do

	   alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	   name=""

	   #first the alphas
	   name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
	   name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
	   name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
	   name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"

	   name="$name-"

	   #then the digits
	   name="$name$[($RANDOM % 10)]"
	   name="$name$[($RANDOM % 10)]"
	   name="$name$[($RANDOM % 10)]"
	   name="$name$[($RANDOM % 10)]"

       if [[ ! " ${used[*]} " =~ " ${name} " ]]; then
          available=1
       fi
   done
   used+=("$name")
   echo $name
done
