#!/bin/bash
#Licensed to https://www.hostingtermurah.net/
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo "--------------- Welcome To Script Menu ---------------"
	echo "----------------- Moded By Zhang-Zi --------------------"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "-----------------------------------------------------"
	echo ""
	echo -e "-----------------[ SSH & OVPN OPTION ]--------------"
	echo -e "${color1}1${color3}.Create User Account (${color2}usernew${color3})"
	echo -e "${color1}2${color3}.Create Trial Account (${color2}trial${color3})"
	echo -e "${color1}3${color3}.Add Active Period SSH & OpenVPN Account (${color2}renew${color3})"
	echo -e "${color1}4${color3}.Delete User Account (${color2}deluser${color3})"
	echo -e "${color1}5${color3}.Check Account Login (${color2}cek${color3})"
	echo -e "${color1}6${color3}.Daftar Member SSH & OpenVPN (${color2}member${color3})"
	echo -e "${color1}7${color3}.Delete User Expired SSH & OpenVPN (${color2}delete${color3})"
	echo -e "${color1}8${color3}.Set up Autokill SSH (${color2}autokill${color3})"
	echo -e "${color1}9${color3}.Displays Users Who Do Multi Login SSH (${color2}ceklim${color3})"
	echo -e "${color1}10${color3}.Restart Service Dropbear, Squid3, OpenVPN dan SSH (${color2}restart${color3})"
	echo -e "======================================================================="
  echo -e "-----------------[ SYSTEM OPTION ]-----------------"
  echo -e "${color1}11${color3}.Speedtest Server (${color2}speedtest${color3})"
  echo -e "${color1}12${color3}.Add Or Change Subdomain Host For VPS (${color2}add-host${color3})"
  echo -e "${color1}13${color3}.Webmin Menu (${color2}wbmn${color3})"
  echo -e "${color1}14${color3}.Check Usage of VPS Ram (${color2}ram ${color3})"
  echo -e "${color1}15${color3}.Reboot VPS (${color2}service squid reboot${color3})"
  echo -e "${color1}16${color3}.Reboot VPS(${color2}reboot${color3})"
  echo -e "${color1}17${color3}.Exit Menu (${color2}exit${color3})"
  echo "------------------------Edited Mod By Di2nk-----------------------------"
read -p "Choose an option from (1-17): " x
if test $x -eq 1; then
usernew
elif test $x -eq 2; then
trial
elif test $x -eq 3; then
renew
elif test $x -eq 4; then
deluser
elif test $x -eq 5; then
cek
elif test $x -eq 6; then
member
elif test $x -eq 7; then
delete
elif test $x -eq 8; then
autokill
elif test $x -eq 9; then
ceklim
elif test $x -eq 10; then
restart
elif test $x -eq 11; then
speedtest
elif test $x -eq 12; then
add-host
elif test $x -eq 13; then
wbmn
elif test $x -eq 14; then
ram
elif test $x -eq 15; then
reboot
elif test $x -eq 16; then
reboot
elif test $x -eq 17; then
echo " "
echo "Goodbye Menu!"
echo " "
exit
else
echo "Options Not Available In Menu."
echo " "
exit
fi
