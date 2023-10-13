#!/bin/bash

dnf check-update

if [ $? -eq 100 ]; then
	dnf upgrade -y
	echo "Update comlete"
else
	echo "No Updates"
fi
