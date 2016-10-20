#!/bin/bash
config="/etc/avrdude.conf";

case "$1" in
        uno)
                #UNO
                avrdude -C$config -v -patmega328p -carduino -P$2 -b115200 -D -Uflash:w:$3:i
                ;;

        nano)
                #NANO
                avrdude -C$config -v -patmega328p -carduino -P$2 -b57600 -D -Uflash:w:$3:i
                ;;

        pro-mini)
                #PRO-MINI
                avrdude -C$config -v -patmega328p -carduino -P$2 -b57600 -D -Uflash:w:$3:i
                ;;

        mega)
                #MEGA 2560
                avrdude -C$config -v -patmega2560 -cwiring -P$2 -b115200 -D -Uflash:w:$3:i
                ;;
        install)
                #
                if [ "$(whoami)" != "root" ]; then
                        echo "Sorry, you are not root."

                else

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
