#!/bin/bash
first=$(./tempread)
if [ $first -eq 1 ]; then
echo "can't read the data"
exit
fi
echo "first temprature is $first"
while :
do
current=$(./tempread)
echo "$current"
let diff=$current-$first
if [ $diff -gt 1000 -a $diff -lt 2000 ] ; then
gpio write 0 1
gpio write 1 0
gpio write 2 0
fi
if [ $diff -gt 2000 -a $diff -lt 3000 ] ; then
gpio write 0 1
gpio write 1 1
gpio write 2 0
fi
if [ $diff -gt 3000 ] ; then
gpio write 0 1
gpio write 1 1
gpio write 2 1
fi
done
