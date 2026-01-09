#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

echo -e "${YELLOW}"
echo "##############################################################"
echo "#                                                            #"
echo "#  ____    _    ____  ____   ___  ____  ____    _            #"
echo "# | __ )  / \  |  _ \| __ ) / _ \/ ___|/ ___|  / \           #"
echo "# |  _ \ / _ \ | |_) |  _ \| | | \___ \\___ \ / _ \          #"
echo "# | |_) / ___ \|  _ <| |_) | |_| |___) |___) / ___ \         #"
echo "# |____/_/   \_\_| \_\____/ \___/|____/|____/_/   \_\        #"
echo "#  BY JLVDK95                                                #"
echo "##############################################################"
echo -e "${NC}"

echo -e "${RED}"
echo "              Wait for it, Captain...           "
sleep 0.3
echo "                    ______             "
echo "                 .-'      '-.          "
echo "                /            \         "
echo "               |              |        "
echo "               |,  .-.  .-.  ,|        "
echo "               | )(__/  \__)( |        "
echo "               |/     /\     \|        "
echo "             (_       ^^      _)       "
echo "                \__|IIIIII|__/         "
echo "                 | \IIIIII/ |          "
echo "                  \________/           "
echo -e "${NC}"
echo -e "${YELLOW}               BARBOSSA IS WATCHING...${NC}"
sleep 1

echo ""
echo -e "${CYAN}-------------------------------------------------------${NC}"
echo -e "${CYAN}          ⚓ BARBOSSA'S GREAT SECURITY AUDIT ⚓          ${NC}"
echo -e "${CYAN}-------------------------------------------------------${NC}"
echo ""

echo -e "${YELLOW}Where should we hunt for cursed gold, Captain?${NC}"
echo "1) Full Home / Dossier Personnel"
echo "2) Images / Pictures"
echo "3) Downloads / Téléchargements"
echo "4) Documents"
echo "5) Videos / Vidéos"
echo ""
read -p "Choose your target [1-5]: " choice

case $choice in
    1) target="$HOME/" ;;
    2) target=$(xdg-user-dir PICTURES) ;;
    3) target=$(xdg-user-dir DOWNLOAD) ;;
    4) target=$(xdg-user-dir DOCUMENTS) ;;
    5) target=$(xdg-user-dir VIDEOS) ;;
    *) target="$HOME/" ;;
esac

echo ""
echo -n "Prepping the cannons... ["
for i in {1..20}; do echo -ne "${GREEN}#${NC}"; sleep 0.04; done
echo "] DONE!"
echo ""

echo -e "${GREEN}[1/3] SHAKING THE MAPS... (Updating Databases)${NC}"
sudo freshclam
sudo rkhunter --propupd
echo ""

echo -e "${CYAN}-------------------------------------------------------${NC}"
echo -e "${GREEN}[2/3] HUNTING FOR STOWAWAYS... (Rootkit Scan)${NC}"
sudo rkhunter --check --sk
echo ""

echo -e "${CYAN}-------------------------------------------------------${NC}"
echo -e "${GREEN}[3/3] INSPECTING THE TARGET... (Virus Scan)${NC}"
echo -e "${YELLOW}>>> Target: $target${NC}"
echo -e "${YELLOW}>>> This may take some time depending on your loot!${NC}"
echo ""
clamscan -r -i "$target" --bell
echo ""

echo -e "${CYAN}##############################################################${NC}"
echo -e "${YELLOW}      ☠️  YOUR SHIP IS SEAWORTHY, CAPTAIN! ☠️        ${NC}"
echo -e "${CYAN}##############################################################${NC}"
echo ""

echo "The scan is complete. You can now close this window."
read
