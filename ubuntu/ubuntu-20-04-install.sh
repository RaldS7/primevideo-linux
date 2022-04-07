#!/bin/bash
echo
echo "Things to do:"
echo """
Save backup of sources.list as /etc/apt/sources.list.bak,
Add wine repository to sources.list,
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
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' | sudo tee -a /etc/apt/sources.list > /dev/null
sudo apt update ; sudo apt install --install-recommends winehq-staging ; sudo apt install curl winetricks
winecfg
winetricks -q dxvk
curl --location --request GET 'https://www.slimjet.com/chrome/download-chrome.php?file=files%2F90.0.4430.72%2FChromeStandaloneSetup.exe' --output /home/$USER/Downloads/Chrome.exe
wine /home/$USER/Downloads/Chrome.exe
elif [[ $answer == "no" || $anser == "NO" ]]; then
echo
echo "Script didn't executed and exiting."
else
echo
echo "Oops, something went wrong. :("
fi
