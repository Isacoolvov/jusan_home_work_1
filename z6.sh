#!/bin/bash

if [ ! -d "BackupDirectory" ]; then
	mkdir BackupDirectory
	echo "Папка BackupDirectory создана"
fi

source_d=("z1.sh")
backup_d=("./BackupDirectory")

filename_backup="backup_$(date +\%Y\%m\%d).tar.gz"

tar -czvf "$backup_d/$filename_backup" "${source_d[@]}"
