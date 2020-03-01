#!/usr/bin/screen -d -m -S prepare /bin/bash
TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'
GREEN='\033[0;32m'

echo && echo
echo -e "${GREEN}██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
echo -e "${GREEN}██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
echo -e "${GREEN}██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  "
echo -e "${GREEN}██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
echo -e "${GREEN}╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
echo -e "${GREEN} ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
echo -e "${NC}                                                                  "
echo && echo && echo

echo -e $GREEN
echo 'This Script Will Install NOS Validator, make sure u are not logged-in as root'
echo -e $TEXT_RESET
echo -e $TEXT_YELLOW
read -p "Press enter to continue"
echo -e $TEXT_RESET

clear

echo 'Installing Nos'
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
sudo usermod -aG sudo $USER
git clone https://github.com/nos/core-control -b nos-devnet> /dev/null 2>&1
cd core-control
./ccontrol.sh install core
clear
read -p "Press enter to continue to start forger"
cd ~/core-control
./ccontrol.sh start forger
read -p "Press enter to continue to check logs and ctrl-C to exit"
./ccontrol.sh logs
clear
echo -e $TEXT_YELLOW
echo 'Now you can add yoor passphrase'
clear
read -p "Press enter to add yoor passphrase with ``` ccontrol secret set {your secret here}`` after that do ./manager.sh reload"
echo -e $TEXT_RESET
clear
cd
rm -rf install_nos_testnet.sh > /dev/null
