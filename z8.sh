#!/bin/bash

read -p "Укажите длину пароля: " pass_in

pass_length=$((pass_in))

> passwords.txt

gen_pass() {
	tr -dc 'A-Za-z0-9' < /dev/urandom | head -c "$pass_length"
	echo
}

for ((i=1; i<=5; i++)); do
	pass=$(gen_pass)
	echo "$pass" >> "passwords.txt"
done

cat "passwords.txt"
