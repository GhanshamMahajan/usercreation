#!/bin/bash
# Author : Ghansham Mahajan
# Use : Create User if not exist.

user="$(cat /etc/passwd | grep 'bash' | cut -d: -f1 | grep -i 'ghansham')"

if [ "$user" != "otisadmin" ] ; then
	useradd -m -c "Linux User | $(date +%m-%d-%Y)" -s /bin/bash ghansham
	usermod -aG sudo otisadmin
	usermod -aG wheel otisadmin
	echo "ghansham:@g4&[8XBKau%ha+<" | chpasswd
else 
    echo "$user already exist"  
fi
