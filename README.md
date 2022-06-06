# Watch Prime Video HD in GNU/Linux
We need wine-staging, wget and Chrome.

# You need to run commands below:
# If you are using Ubuntu & Debian:
If your system is 64 bit, enable 32 bit architecture (if you haven't already):
```
sudo dpkg --add-architecture i386 
```
Download and add the repository key: 
```
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo mv winehq.key /usr/share/keyrings/winehq-archive.key
```
Take backup of sources.list:
```
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
```
Add the repository: 
For Ubuntu 20.04: 
```
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources && sudo mv winehq-focal.sources /etc/apt/sources.list.d/
```
For Ubuntu 21.10:
```
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/impish/winehq-impish.sources && sudo mv winehq-impish.sources /etc/apt/sources.list.d/
```
For Ubuntu 21.04:

__NOTE:__ 2022-06-06 This Ubuntu version no longer visible in wine's ubuntu webpage, so here is adding repo old style.
```
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Ubuntu 20.10:

__NOTE:__ 2022-06-06 This Ubuntu version no longer visible in wine's ubuntu webpage, so here is adding repo old style.
```
echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main' | sudo tee -a /etc/apt/sources.list > /dev/null
```
For Ubuntu 22.04:
```
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources && sudo mv winehq-jammy.sources /etc/apt/sources.list.d/
```
For:
Ubuntu 18.04
Linux Mint 19.x

__NOTE:__ Ubuntu 18.04/Linux Mint 19.x do not provide FAudio, which is a dependency of Wine versions prior to 6.21. Users of the current wine-stable packages will need to install this. Follow the instructions in https://forum.winehq.org/viewtopic.php?f=8&t=32192 to install FAudio from the OBS. (FAudio packages for Ubuntu 19.10 and later are in the distro's universe repository.) 
```
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/bionic/winehq-bionic.sources && sudo mv winehq-bionic.sources /etc/apt/sources.list.d/
```
Update packages: 
```
sudo apt update
```
Then install wine-staging:
```
sudo apt install --install-recommends winehq-staging
```
For Debian:

__NOTE:__ The WineHQ packages for Debian 10 and later require libfaudio0 as a dependency. Since the distro does not provide it for Debian 10, users of that version can download libfaudio0 packages from the OBS. See https://forum.winehq.org/viewtopic.php?f=8&t=32192 for details.


For Debian 10 (Buster):
```
wget -nc https://dl.winehq.org/wine-builds/debian/dists/buster/winehq-buster.sources && sudo mv winehq-buster.sources /etc/apt/sources.list.d/
```
For Debian 11 (Bullseye):
```
wget -nc https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources && sudo mv winehq-bullseye.sources /etc/apt/sources.list.d/
```
For Debian Testing (Bookworm):
```
wget -nc https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources && sudo mv winehq-bookworm.sources /etc/apt/sources.list.d/
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
If there is a Chrome shortcut file on your Desktop, you can also add --no-sandbox parameter with editing it. 
Right click on Chrome shortcut file,
Open with text editor,
In exec section add --no-sandbox parameter in the end of line.

Here is a my Google shortcut file:
```
cat ~/.local/share/applications/wine/Programs/Google\ Chrome.desktop
[Desktop Entry]
Name=Google Chrome
Exec=env WINEPREFIX="/home/nxjoseph/.wine" wine C:\\\\ProgramData\\\\Microsoft\\\\Windows\\\\Start\\ Menu\\\\Programs\\\\Google\\ Chrome.lnk --no-sandbox
Type=Application
StartupNotify=true
Comment=İnternet'e erişin
Path=/home/nxjoseph/.wine/dosdevices/c:/Program Files/Google/Chrome/Application
Icon=6F89_chrome.0
StartupWMClass=chrome.exe
```

# For Chrome version 90 and older versions;
After installed Chrome, open Chrome.
Go to chrome://components address.
```
chrome://components
```
Update Widevine Component.

![image from components](https://imgur.com/eDiUHtTl.png "Widevine Component")

After updated that component, restart Chrome.

# Enjoy the HD quality!
