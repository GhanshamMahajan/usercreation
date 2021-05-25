#!/bin/bash
# Author : Ghansham Mahajan
# Use : Apply the password policy for existing user

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2  				# Check if script running by root or not
   exit 1									#If it's not run by root then it will exit the script
fi

user="$(cat /etc/passwd | grep 'bash' | cut -d: -f1 | grep -i 'ghansham')"	#Collect the user name in variable 

if [ "$user" != "ghansham" ] ; then						# Verify if user is match or not
    useradd -m -c "DevOps User | $(date +%m-%d-%Y)" -s /bin/bash ghansham	#If user is not match then useradd command get execute
    usermod -aG sudo ghansham							#add the sudo group if it's Ubuntu
    usermod -aG wheel ghansham							#add the sudo group if it's Ubuntu
    echo "ghansham:]fyjVZLM@g4&[8XBKau%ha+<" | chpasswd				#Set the password for newly created user
else 
    echo "$user already exist"  
fi
