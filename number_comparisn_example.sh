#!/bin/bash
echo "Please enter first number"
read first
echo "Please enter second number"
read second

if [ $first -eq 0 ] && [ $second -eq 0 ]
then
	echo "Num1 and Num2 are zero"
elif [ $first -eq $second ]
then
	echo "Both Values are equal"
elif [ $first -gt $second ]
then
	echo "$first is greater than $second"
else
	echo "$first is lesser than $second"
fi


################ Example ##################
$ ./numbers.sh
Please enter first number
1
Please enter second number
1
Both Values are equal

$ ./numbers.sh
Please enter first number
3
Please enter second number
12
3 is lesser than 12
