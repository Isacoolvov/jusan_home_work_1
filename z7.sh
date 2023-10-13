#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Нет файла в качестве аргумента"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "Файл '$1' не существует"
	exit 1
fi

words=$(wc -w < "$1")

echo "Количество слов: '$words'"
