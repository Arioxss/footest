# !/bin/bash
read -p "Enter desirable action: 1 - interface config, 2 - dns default config " temp123

case "$temp123" in

"1" ) echo "You've chosen interface config"
	read -p "Interface name in system: " iname
	#echo "$iname"
	read -p "ip address: " iadd
	#echo "$iadd"
	read -p "netmask: " imask
	#echo "$imask"
	read -p "Configure default gateway(y or no) : " suredg
	#echo "this is $suredg"
		if [ "$suredg" = y ]
		then
			read -p "Default gateway address: " dgate
		else
			echo "Fine you cock i won't do it UwU"
			dgate="none"
		fi
	echo -e "Your ip int name is: $iname,\nIp address is: $iadd,\nNetmask is $imask,\nDefault gateway is $dgate"
	
	echo " " >> /etc/network/interfaces
	echo -e "auto $iname\niface $iname inet static\naddress $iadd\nnetmask $imask" >> /etc/network/interfaces
	if [ "$suredg" = y ]
	then
		 echo "gateway $dgate" >> /etc/network/interfaces
	fi
	systemctl restart networking
;;
"2" ) echo "You've chosen dns defailt config";;
* ) echo "hehe te nandayo";;

#echo "you've chosen that action: $temp123"

esac
exit 0
