# AVRDuino
A simple Bash Script for upload a .hex Arduino on Linux



Install
1.Frist you should install the git ,so that you can clone the git 

sudo apt-get update -y 
sudo apt-get upgrade -y 
sudo apt-get install git 

2.Clone git to local
git clone https://github.com/sakunamary/AVRDuino.git

3.run following scripts
   cd AvrDuino 
   sudo avrduino install  

Usage
avrduino programmer  port  .hex file   like this :
avrduino usbtiny usb:001:001 boot.hex



