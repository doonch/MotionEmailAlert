#!/bin/bash

array[0]="Hi,"
array[1]="Hello,"
array[2]="Hey!"
array[3]="Yo yo,"
array[4]="Greetings,"
array[5]="Ummm, well,"
array[6]="Dear you,"
array[7]="How shall I put this,"

size=${#array[@]}
index=$((RANDOM % $size))
echo ${array[$index]}

