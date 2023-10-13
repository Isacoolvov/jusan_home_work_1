#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Нет ключевого слова в качестве аргумента"
	exit 1
fi

find ./ -type f | grep "$1"
