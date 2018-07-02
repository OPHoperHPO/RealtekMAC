# This code is written by Anodev https://github.com/OPHOPERHPO/
set value_changer
set mac
set mac_no
set new_mac
mac=`cat /sys/class/net/wlan0/address`
hexchars="0123456789ABCDEF"
end=$( for i in {1..6} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/:\1/g' )
mac_no=71:44:4A$end #CHANGE THIS FOR OTHER MAC VENDOR
echo -e "\e[1;32m
Hello, I am RMCS - Realtek Mac Changer Script V1.1:)
This tool will change your original MAC $mac to $mac_no! 
Please rerun for other MAC!
Made by Anodev!
Default generates Unknown Vendor MAC address! You can change it.
TESTED ON KALI 2018.2, but maybe works on UNIX-like OS with bash interpreter! \e[0m
\e[1;31mYou MUST follow license terms. License is indicated on https://github.com/OPHoperHPO/RealtekMAC/
You CANNOT use this tool for illegal activities!\e[0m
\e[1;32m1 - Agree this conditions.\e[0m
\e[1;31m0 - Decline this conditions and exit.\e[0m"
set value_card
read value_changer

if (($value_changer == "0"))  
  then
  exit
fi

if (($value_changer == "1"))  
  then
 echo "Select Your Realtek Network card:
 1- Realtek 8723bs
 2- Realtek 8188eu"
 read value_card
 if (($value_card == "0"))  
  then
  exit
fi
if (($value_changer == "1")) # RTL8723bs 
  then
   echo "New mac is $mac_no" 
  sudo rmmod r8723bs
  sudo modprobe r8723bs rtw_initmac=$mac_no
  new_mac=`cat /sys/class/net/wlan0/address`
  echo "I will print your mac in the system, сompare this mac with your original MAC!
     Your mac in the system: $new_mac"
fi
if (($value_changer == "2")) # RTL8188eu
  then
   echo "New mac is $mac_no" 
  sudo rmmod r8188eu
  sudo modprobe r8188eu rtw_initmac=$mac_no
  new_mac=`cat /sys/class/net/wlan0/address`
  echo "I will print your mac in the system, сompare this mac with your original MAC!
     Your mac in the system: $new_mac"
fi
fi
