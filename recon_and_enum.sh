#!/bin/bash
user=$(whoami)
echo "Good day,who are you gonna be logged in as today?
1 - User
2 - root"
read login
if [[ $login == 1 ]]; then
	echo "Welcome $user"
else
	echo "Switch user with the command 'su user' and try again"
	exit 1
fi	
sleep 2
echo "The phases of ethical hacking --- unified cyber kill chain"
sleep 1
echo "Let's start with reconnaissance"
sleep 2
echo "Chill bruhva..............."
sleep 1
target=$1
nslookup=$(nslookup $target > nslookup.txt)
whois=$(whois $target > whois.txt)
echo "$nslookup" &
sleep 2
echo "$whois" &
sleep 3
echo "Kindly wait a lil bit,maybe 10sec"
sleep 6 
echo "would you like to move on with enumeration? (y/n)?"
read enum
if [[ $enum == "y" ]]; then
	echo "kindly select your enumeration tool
	1 - nmap
	2 - nikto
	3 - nessus
	4 - kioptrix"
	read tool
	case $tool in
		1)
			nmap=$(nmap -A -T4 -p- $1 > nmap.txt &)
			echo "$nmap"
			sleep 15
			;;
		2)
			echo "Kindly check out nikto on their platform"	
			;;
		3)
			echo "kindly check out nessus on their platform"
			;;
		4)
			echo "kindly check out nessus on their platform"
			;;
	esac
else
	echo "Goodbye"
	exit 1	
fi
sleep 4
exit 1
