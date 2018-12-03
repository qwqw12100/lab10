#!/bin/bash

for value in {0..3}
do
	gpio mode $value out
done

gpio write 0 0
gpio write 1 0
gpio write 2 0

first=$(./tempread)
temp=first
if [ $first -eq 1 ]; then
echo "can't read the data"
exit
fi
echo "first temprature is $first"
while :
do
current=$(./tempread)
echo "$current"
let diff=$current-$temp
if [ $diff -lt 0 ] ; then
let diff=$temp-$current
fi
if [ $diff -gt 1000 ] ; then
gpio write 0 1
fi
if [ $diff -gt 2000 ] ; then
gpio write 1 1
fi
if [ $diff -gt 3000 ] ; then
gpio write 2 1
fi
done
