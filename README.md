# Watch Prime Video HD in GNU/Linux

## Requirements

- [wget](#install-wget)
- [wine-staging](#installing-instructions-wine-staging-and-winetricks-for-distributions)
- [winetricks](#installing-instructions-wine-staging-and-winetricks-for-distributions)
- [Google Chrome (Windows version)](#before-installing-google-chrome)

## Install wget
__Ubuntu & Debian__
```
sudo apt install wget
```
__Arch Linux__
```
sudo pacman -S wget --needed
```
__Fedora__
```
sudo dnf install wget
```

## Installing instructions wine-staging and winetricks for distributions

- [Ubuntu](#installing-instructions-for-ubuntu)
- [Debian](#installing-instructions-for-debian)
- [Arch Linux](#installing-instructions-for-arch-linux)
- [Fedora](#installing-instructions-for-fedora)


## Installing instructions for Ubuntu
[Go top](#watch-prime-video-hd-in-gnulinux)

If your system is 64 bit, enable 32 bit architecture (if you haven't already)
```
sudo dpkg --add-architecture i386
```
Download and add the repository key
```
sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```
### Add wine's repository for your Ubuntu version

> Ubuntu 18.04/Linux Mint 19.x do not provide FAudio, which is a dependency of Wine versions prior to 6.21. Users of the current wine-stable packages will need to install this. Follow the instructions in https://forum.winehq.org/viewtopic.php?f=8&t=32192 to install FAudio from the OBS. (FAudio packages for Ubuntu 19.10 and later are in the distro's universe repository.)

__Ubuntu 18.04 (Bionic Beaver)__, __Linux Mint 19.x__


```
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/bionic/winehq-bionic.sources
```
__Ubuntu 20.04 (Focal Fossa)__, __Linux Mint 20.x__
```
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
```

__Ubuntu 22.04 (Jammy Jellyfish)__, __Linux Mint 21.x__
```
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
```
### Update packages
```
sudo apt update
```
### Install wine-staging
```
sudo apt install --install-recommends winehq-staging
```

### Install winetricks
```
sudo apt install winetricks
```

## Installing instructions for Debian
[Go top](#watch-prime-video-hd-in-gnulinux)

If your system is 64 bit, enable 32 bit architecture (if you haven't already)
```
sudo dpkg --add-architecture i386
```
Download and add the repository key
```
sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```
### Download the WineHQ sources file

> The WineHQ packages for Debian 10 and later require libfaudio0 as a dependency. Since the distro does not provide it for Debian 10, users of that version can download libfaudio0 packages from the OBS. See https://forum.winehq.org/viewtopic.php?f=8&t=32192 for details.

__Debian 10 (Buster)__
```
sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/buster/winehq-buster.sources
```
__Debian 11 (Bullseye)__
```
sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
```
__Debian Testing (Bookworm)__
```
sudo wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
```
### Update packages
```
sudo apt update
```
### Install wine-staging
```
sudo apt install --install-recommends winehq-staging
```

### Install winetricks
```
sudo apt install winetricks
```

## Installing instructions for Arch Linux
[Go top](#watch-prime-video-hd-in-gnulinux)

### Enable multilib repository from `/etc/pacman.conf`

Go to /etc/pacman.conf with nano editor
```
sudo nano /etc/pacman.conf
```
Find the line starting with [multilib] and uncomment them, it must be seem like this
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Save and exit.

### Update packages
```
sudo pacman -Sy
```
### Install wine-staging
```
sudo pacman -S wine-staging
```

### Install winetricks
```
sudo pacman -S winetricks
```

## Installing instructions for Fedora
[Go top](#watch-prime-video-hd-in-gnulinux)

Add the repository for __Fedora 36__
```
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/36/winehq.repo
```
Add the repository for __Fedora 35__
```
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/35/winehq.repo
```
### Install wine-staging
```
sudo dnf install winehq-staging
```

### Install winetricks
```
sudo dnf install winetricks
```

# Before installing Google Chrome

### Open winecfg and make sure your Windows version is "Windows 7" then exit
```
winecfg
```

### Install dxvk
```
winetricks -q dxvk
```

# Installing Google Chrome
Download Google Chrome using user agent switcher addon for your browser. You need to change user agent for be able to download Windows version of Google Chrome, otherwise they detect that you are using linux distribution and force to download Google Chrome's linux packages.

[Google Chrome](https://www.google.com/chrome/)

Go to where Google Chrome's exe downloaded, usually it'll be Downloads directory.
```
cd /path/to/exe
```
Run Google Chrome with wine and install.
```
wine ChromeSetup.exe
```
After installed, you have to start Chrome with `--no-sandbox` parameter. You can add this parameter by editing Chrome's desktop file. There may be Chrome's desktop file on your Desktop, right click on it and edit with any text editor. In the `Exec=` section, add `--no-sandbox` to end of that line.

If there is not a Chrome shortcut file on your Desktop,

edit this `~/.local/share/applications/wine/Programs/Google\ Chrome.desktop` file with nano or any graphical text editor you want.
```
nano ~/.local/share/applications/wine/Programs/Google\ Chrome.desktop
```
or ( gedit usually installed on gnome desktop environment. if you don't use gedit, replace `gedit` with your text editor.)
```
gedit ~/.local/share/applications/wine/Programs/Google\ Chrome.desktop
```
In the `Exec=` section, add `--no-sandbox` to end of that line.

Example Chrome desktop file
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

Now you can run Chrome in two way
- Click Chrome on your Desktop
- Start Chrome on your application launcher.

> If you only added `--no-sandbox` parameter to one of both, start Chrome which you added the parameter.

# Enjoy the HD quality!


## Troubleshooting

### If primevideo says you are using older versions of Chrome, try updating your Widevine component.
Open Google Chrome and go to `chrome://components` address.
Scroll down, find Widevine component and update it.

![image from components](https://imgur.com/eDiUHtTl.png "Widevine Component")

After updated that component, restart Google Chrome and try again.
