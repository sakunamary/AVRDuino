#!/bin/bash
config="/etc/avrdude.conf";
# $1 means board type 
# $2 means programmer type usbtiny, arduino as ISP e.g.
# $3 means usb port or serial port. for avrdude 6.0 or above ,you can us "lsusb" and than get usb info as following format "usb:bus:device".avrdude will use "-P usb:001:001"to connect usb device like USBTinyISP  


case "$1" in
        uno)
                #UNO
                avrdude -C $config -v -p atmega328p -c $2  -P $3 -b115200 -D -U flash:w:$4:i
                ;;

        nano)
                #NANO
                avrdude -C $config -v -p atmega328p -c $2 -P $3 -b57600 -D -U flash:w:$4:i
                ;;

        pro-mini)
                #PRO-MINI
                avrdude -C $config -v -p atmega328p -c $2 -P$3 -b57600 -D -U flash:w:$4:i
                ;;

        mega)
                #MEGA 2560
                avrdude -C $config -v -p atmega2560 -c $2 -P $3 -b115200 -D -Uflash:w:$4:i
                ;;
        install)
                #
                if [ "$(whoami)" != "root" ]; then
                        echo "Sorry, you are not root."

                else
                        #wget https://raw.githubusercontent.com/Gruniek/AVRDuino/master/avrduino.sh
                        chmod 777 avrduino.sh
                        mv avrduino.sh /bin/avrduino
                        apt-get update
                        apt-get install avrdude
                        cd /etc/
                        mv /etc/avrdude.conf /etc/avrdude.back
                        wget https://raw.githubusercontent.com/Gruniek/AVRDuino/master/avrdude.conf
                        echo '[ DONE ]'
                fi
                ;;

        --help)
                #
                echo "Select Option in root : 'install' for install and configure all program";
                echo " ";
                echo "USAGE : Select the card";
                echo "        uno  -> Arduino UNO";
                echo "        nano -> Arduino NANO";
                echo "        pro-mini -> Arduino Pro-Mini 5v 16mhz";
                echo "        mega     -> Arduino MEGA2560";
                echo " ";
                echo "        Select the port (ls /dev/tty*)";
                echo " ";
                echo "        Select the .hex to upload";
                echo " ";
                echo "- Enjoy ! -";
                ;;


        *)
                echo "type --help";

esac
