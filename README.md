# Watch Prime Video HD in GNU/Linux
We need wine-staging and Chrome.

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
Thirdly, Download Chrome with user-agent switcher addon for your browser. We need to change user agent for be able to download exe version of Chrome, if we don't change our user agent to Windows, chrome detect that we are using linux and recommends chrome's linux packages.

https://www.google.com/chrome/

Go to where .exe downloaded.
```
cd /path/to/exe
```
Run the .exe file with wine and install.
```
wine *.exe
```
After installed, you have to start Chrome with --no-sandbox parameter.
I run Chrome with that command below:
```
wine .wine/drive_c/Program\ Files/Google/Chrome/Application/chrome.exe --no-sandbox
```

# For version 90 and older versions;
After installed Chrome, open Chrome.
Go to chrome://components address.
```
chrome://components
```
Update Widevine Component.

![image from components](https://imgur.com/eDiUHtTl.png "Widevine Component")

After updated that component, restart Chrome.

# Enjoy the HD quality!
