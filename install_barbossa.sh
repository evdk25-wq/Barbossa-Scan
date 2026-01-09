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
echo -e "${YELLOW}               INSTALLING BARBOSSA...${NC}"
sleep 1

echo -e "${CYAN}-------------------------------------------------------${NC}"
echo -e "${GREEN}>>> LOADING CANNONS (Installing software...)${NC}"
sudo apt update && sudo apt install -y clamav rkhunter konsole

echo -e "${GREEN}>>> PREPARING THE CABIN (Creating folders...)${NC}"
mkdir -p "$HOME/.local/share/barbossa"

echo -e "${GREEN}>>> SECURING THE LOOT (Copying files...)${NC}"
cp ./scan_securite.sh "$HOME/.local/share/barbossa/"
cp ./pirate.svg "$HOME/.local/share/barbossa/"
chmod +x "$HOME/.local/share/barbossa/scan_securite.sh"

echo -e "${GREEN}>>> MAPPING THE STARS (Creating Menu Shortcut...)${NC}"
cat <<EOF > "$HOME/.local/share/applications/barbossa-scan.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Barbossa Scan
Comment=Security Audit by JLVDK95
Exec=sh -c 'if command -v konsole >/dev/null; then konsole -e /bin/bash -c "$HOME/.local/share/barbossa/scan_securite.sh"; elif command -v gnome-terminal >/dev/null; then gnome-terminal -- /bin/bash -c "$HOME/.local/share/barbossa/scan_securite.sh"; else x-terminal-emulator -e "$HOME/.local/share/barbossa/scan_securite.sh"; fi'
Icon=$HOME/.local/share/barbossa/pirate.svg
Terminal=false
Categories=System;Security;
StartupNotify=true
EOF

chmod +x "$HOME/.local/share/applications/barbossa-scan.desktop"
update-desktop-database ~/.local/share/applications/

echo -e "${CYAN}-------------------------------------------------------${NC}"
echo -e "${YELLOW}      INSTALLATION SUCCESSFUL, CAPTAIN!        ${NC}"
echo -e "${CYAN}#######################################################${NC}"
echo ""

echo "Installation complete. You can now close this window."
read
