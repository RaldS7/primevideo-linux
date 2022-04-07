#!/bin/bash
echo
echo "Things to do:"
echo """
Save backup of pacman.conf as /etc/pacman.conf.bak,
Add multilib repository to pacman.conf (we need to enable multilib repo for install wine),
Install wine-staging and winetricks,
Open winecfg, 'you should change Windows Version to "Windows 7"',
Install dxvk with winetricks,
Go to Downloads, execute the exe file with wine.
"""
echo "Do you want to continue?"
echo "Type yes or no "
echo
read answer
if [[ $answer == "yes" || $answer == "YES" ]]; then
echo
echo "Script executed."
sudo cp /etc/pacman.conf /etc/pacman.conf.bak
#echo [multilib] >> /etc/pacman.conf
echo "[multilib]" | sudo tee -a /etc/pacman.conf > /dev/null
#echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
sudo pacman -Sy wine-staging winetricks
winecfg
winetricks -q dxvk
cd ~/Downloads/
wine *.exe
elif [[ $answer == "no" || $anser == "NO" ]]; then
echo
echo "Script didn't executed and exiting."
else
echo
echo "Oops, something went wrong. :("
fi
