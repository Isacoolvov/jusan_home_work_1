#!/bin/bash

text="00 00 * * * root ./z6.sh"

temp_c=$(mktemp)

crontab -l > "$temp_c"

echo "$text" >> "$temp_c"

crontab "$temp_c"

rm "$temp_c"

echo "Complete"
