# Watch Prime Video HD in GNU/Linux
We need wine-staging, wget and Chrome.

# You need to run commands below:
## Installing instructions for Ubuntu
If your system is 64 bit, enable 32 bit architecture (if you haven't already):
```
sudo dpkg --add-architecture i386 
```
Download and add the repository key: 
```
sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```
Add the repository:
For Ubuntu 18.04 (Bionic Beaver), Linux Mint 19.x:
> NOTE:  Ubuntu 18.04/Linux Mint 19.x do not provide FAudio, which is a dependency of Wine versions prior to 6.21. Users of the current wine-stable packages will need to install this. Follow the instructions in https://forum.winehq.org/viewtopic.php?f=8&t=32192 to install FAudio from the OBS. (FAudio packages for Ubuntu 19.10 and later are in the distro's universe repository.)
```
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/bionic/winehq-bionic.sources
``` 
For Ubuntu 20.04 (Focal Fossa), Linux Mint 20.x:
```
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
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
For Ubuntu 22.04 (Jammy Jellyfish), Linux Mint 21.x:
```
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
```
Update packages: 
```
sudo apt update
```
Then install wine-staging:
```
sudo apt install --install-recommends winehq-staging
```
## Installing instructions for Debian
If your system is 64 bit, enable 32 bit architecture (if you haven't already):
```
sudo dpkg --add-architecture i386 
```
Download and add the repository key: 
```
sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```
Download the WineHQ sources file:

> NOTE: The WineHQ packages for Debian 10 and later require libfaudio0 as a dependency. Since the distro does not provide it for Debian 10, users of that version can download libfaudio0 packages from the OBS. See https://forum.winehq.org/viewtopic.php?f=8&t=32192 for details.

For Debian 10 (Buster):
```
sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/buster/winehq-buster.sources
```
For Debian 11 (Bullseye):
```
sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
```
For Debian Testing (Bookworm):
```
sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
```
Update packages: 
```
sudo apt update
```
Then install wine-staging:
```
sudo apt install --install-recommends winehq-staging
```
## Installing instructions for Arch Linux
Enable multilib repository from /etc/pacman.conf
Go to /etc/pacman.conf with nano editor
```
sudo nano /etc/pacman.conf
```
Find the line starting with [multilib] and uncomment them, it must be like that:
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
## Installing instructions for Fedora
Add the repository for Fedora 36:
```
dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/36/winehq.repo
```
Add the repository for Fedora 35:
```
dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/35/winehq.repo
```
Install wine-staging:
```
dnf install winehq-staging
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
Open your winecfg and make sure your Windows version is "Windows 7".
```
winecfg
```
Close it.
Secondly, enable dxvk.
```
winetricks -q dxvk
```
Thirdly, Download Chrome with user-agent switcher addon for your browser. We need to change user agent for be able to download exe version of Chrome, if we don't change our user agent to Windows, they detect that we are using linux and recommends chrome's linux packages.

https://www.google.com/chrome/

Go to where Chrome's exe downloaded, usually it'll be Downloads.
```
cd /path/to/exe
```
Run Chrome's exe file with wine and install.
```
wine ChromeSetup.exe
```
After installed, you have to start Chrome with `--no-sandbox` parameter. You can add this parameter by editing Chrome's desktop file. There may be Chrome's desktop file on your Desktop, right click on it and edit with any text editor. In the `Exec=` section, add `--no-sandbox` to end of that line.

If there is not a Chrome shortcut file on your Desktop:

Edit this `~/.local/share/applications/wine/Programs/Google\ Chrome.desktop` file with nano or any graphical text editor you want.
```
nano ~/.local/share/applications/wine/Programs/Google\ Chrome.desktop
```
or ( gedit usually installed on gnome desktop environment. if you don't use gedit, replace `gedit` with your text editor.)
```
gedit ~/.local/share/applications/wine/Programs/Google\ Chrome.desktop
```
In the `Exec=` section, add `--no-sandbox` to end of that line.

Example Chrome desktop file:
```
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

Now you can run Chrome in two way:
- Click Chrome on your Desktop 
- Start Chrome on your application launcher.

> If you only added `--no-sandbox` parameter to one of both, start Chrome which you added the parameter.

# Enjoy the HD quality!


## Troubleshooting

### If primevideo says you are using older versions of Chrome, try updating Widevine component.
Open Chrome and go to chrome://components address.
Scroll down, find Widevine component and update it.

![image from components](https://imgur.com/eDiUHtTl.png "Widevine Component")

After updated that component, restart Chrome and try again.

