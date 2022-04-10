# Watch Prime Video HD in GNU/Linux
We need wine-staging, i have wine 7.5 (staging) now and it works perfect.
We need Chrome (90), latest version is 100 but i can't open it with wine.
Update: update came to wine-staging and it's 7.6 now but it's still working.
Let's install them.
# You need to run commands below:
# If you are using Ubuntu & Debian:
If your system is 64 bit, enable 32 bit architecture (if you haven't already):
```
sudo dpkg --add-architecture i386 
```
Download and add the repository key: 
```
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
```
Take backup of sources.list:
```
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
```
Add the repository: 
For Ubuntu 20.04: 
```
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Ubuntu 21.10:
```
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Ubuntu 21.04:
```
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Ubuntu 20.10:
```
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
Update packages: 
```
sudo apt update
```
Then install wine-staging:
```
sudo apt install --install-recommends winehq-staging
```
For Debian 10 (Buster):
```
echo 'deb https://dl.winehq.org/wine-builds/debian/ buster main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Debian 11 (Bullseye):
```
echo 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Debian Testing (Bookworm):
```
echo 'deb https://dl.winehq.org/wine-builds/debian/ bookworm main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
Update packages: 
```
sudo apt update
```
Then install wine-staging:
```
sudo apt install --install-recommends winehq-staging
```
# If you are using Arch-based distros:
Enable multilib repository from /etc/pacman.conf
Go to /etc/pacman.conf with nano editor
```
sudo nano /etc/pacman.conf
```
Find the line starting with [multilib]
Uncomment them, it must be like that:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
Update packages:
```
sudo pacman -Sy
```
Then install wine-staging:
```
sudo pacman -S wine-staging
```
# We need winetricks to enable dxvk
For Ubuntu & Debian:
```
sudo apt install winetricks
```
For Arch-based distros:
```
sudo pacman -S winetricks
```
# Let's get started.
Firstly, clear your terminal if you didn't because we did a lot of things.
```
clear
```
Open your winecfg and make your Windows version "Windows 7"
```
winecfg
```
Close it.
Secondly, enable dxvk.
```
winetricks -q dxvk
```
Thirdly, Download Chrome (90) from Slimjet.
https://www.slimjet.com/chrome/download-chrome.php?file=files%2F90.0.4430.72%2FChromeStandaloneSetup.exe

Go to where .exe downloaded.
```
cd /path/to/exe
```
Run the .exe file with wine and install.
```
wine *.exe
```
# Start Chrome and Enjoy the HD quality!
