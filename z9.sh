#!/bin/bash

dir_c=0
file_c=0

for i in *; do
	if [ -d "$i" ]; then
		((dir_c++))
	elif [ -f "$i" ]; then
		((file_c++))
	fi
done

echo -e "DIR's: $dir_c\nFiles: $file_c"
