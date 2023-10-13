#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Аргумент отсутствует"
	exit 1
fi

tac "$1"



