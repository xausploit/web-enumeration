#!/bin/bash
echo "This web recon runs nikto,sublist3r,nslookup,whois...nmap on the target is optional"
user=$(whoami)
echo "Good day,who are you gonna be logged in as today?
1 - echo '$user'
2 - root"
read login
if [[ $login == 1 ]]; then
	echo "Welcome $user"
else
	echo "Switch user with the command 'su user' and try again"
	exit 1
fi	
sleep 2
echo "Let's do some web recon"
dir=$(cd ~/Desktop && mkdir WEB)
echo "$dir"
sleep 1
echo "Let's start with reconnaissance"
sleep 1
echo "Kindly enter target"
read target
nslookup=$(nslookup $target > ~/Desktop/WEB/nslookup.txt)
whois=$(whois $target >  ~/Desktop/WEB/whois.txt)
nikto=$(nikto -h $target >  ~/Desktop/WEB/nikto_scan.txt)
sublister=$(sublist3r -d $target >  ~/Desktop/WEB/sublister.txt)
echo "this might take a while...................................................."
echo "$nslookup"
echo "$whois"
echo "$nikto"
echo "$sublister"
echo "would you like to move on with nmap (y/n)?"
read enum
if [[ $enum == "y" ]]; then
	nmap=$(nmap -A -T4 -p- $1 >  ~/Desktop/WEB/nmap.txt &)
	echo "$nmap"
else
	echo "Goodbye"
	exit 1	
fi
exit 1
