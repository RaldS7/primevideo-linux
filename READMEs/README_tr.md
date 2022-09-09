# GNU/Linux dağıtımında Prime Video'yu HD izleme rehberi

## Gerekenler

- [wget](#wget-y%C3%BCkleyin)
- [wine-staging](#baz%C4%B1-da%C4%9F%C4%B1t%C4%B1mlar-i%C3%A7in-wine-staging-ve-winetricks-y%C3%BCkleme-talimatlar%C4%B1)
- [winetricks](#baz%C4%B1-da%C4%9F%C4%B1t%C4%B1mlar-i%C3%A7in-wine-staging-ve-winetricks-y%C3%BCkleme-talimatlar%C4%B1)
- [Google Chrome (Windows versiyonu)](#google-chrome-y%C3%BCklemeden-%C3%B6nce-yap%C4%B1lacaklar)

## wget yükleyin
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

## Bazı dağıtımlar için wine-staging ve winetricks yükleme talimatları

- [Ubuntu](#ubuntu-i%C3%A7in-kurulum-talimatlar%C4%B1)
- [Debian](#debian-i%C3%A7in-kurulum-talimatlar%C4%B1)
- [Arch Linux](#arch-linux-i%C3%A7in-kurulum-talimatlar%C4%B1)
- [Fedora](#fedora-i%C3%A7in-kurulum-talimatlar%C4%B1)


## Ubuntu için kurulum talimatları
[Başa dön](#gnulinux-da%C4%9F%C4%B1t%C4%B1m%C4%B1nda-prime-videoyu-hd-izleme-rehberi)

Eğer sistemin 64 bit ise, 32 bit mimarisini aktif etmediysen et.
```
sudo dpkg --add-architecture i386
```
Depo anahtarını indirin ve yükleyin.
```
sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```
### Ubuntu versiyonunuza göre wine deposu ekleyin.

> Ubuntu 18.04/Linux Mint 19.x, 6.21'den önceki Wine sürümlerinin bağımlılığı olan FAudio sağlamaz. Kullanıcılarının bunu yüklemesi gerekecek. FAudio'yu OBS'den yüklemek için https://forum.winehq.org/viewtopic.php?f=8&t=32192 içindeki talimatları izleyin. (Ubuntu 19.10 ve sonraki sürümleri için FAudio paketleri, dağıtımın universe deposundadır.)

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
### Paketleri güncelleyin
```
sudo apt update
```
### wine-staging yükleyin
```
sudo apt install --install-recommends winehq-staging
```

### winetricks yükleyin
```
sudo apt install winetricks
```

## Debian için kurulum talimatları
[Başa dön](#gnulinux-da%C4%9F%C4%B1t%C4%B1m%C4%B1nda-prime-videoyu-hd-izleme-rehberi)

Eğer sistemin 64 bit ise, 32 bit mimarisini aktif etmediysen et.
```
sudo dpkg --add-architecture i386
```
Depo anahtarını indirin ve yükleyin.
```
sudo wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```
### wineHQ sources dosyasını indirin ve yükleyin.

> Debian 10 ve sonraki sürümleri için WineHQ paketleri, bağımlılık olarak libfaudio0 gerektirir. Dağıtım Debian 10 için sağlamadığından, bu sürümün kullanıcıları OBS'den libfaudio0 paketlerini indirebilir. Ayrıntılar için https://forum.winehq.org/viewtopic.php?f=8&t=32192 adresine bakın.

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
### Paketleri güncelleyin
```
sudo apt update
```
### wine-staging yükleyin
```
sudo apt install --install-recommends winehq-staging
```

### winetricks yükleyin
```
sudo apt install winetricks
```

## Arch Linux için kurulum talimatları
[Başa dön](#gnulinux-da%C4%9F%C4%B1t%C4%B1m%C4%B1nda-prime-videoyu-hd-izleme-rehberi)

### multilib deposunu `/etc/pacman.conf` dosyasından aktif edin

`/etc/pacman.conf` dosyasını nano editör ile düzenleyin
```
sudo nano /etc/pacman.conf
```
Multilib ile başlayan satırın başındaki # işaretlerini kaldırın, aşağıdaki gibi görünmeli.  [Ctrl+X].
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Kaydedin ve çıkın

### Paketleri güncelleyin
```
sudo pacman -Sy
```
### wine-staging yükleyin
```
sudo pacman -S wine-staging
```

### winetricks yükleyin
```
sudo pacman -S winetricks
```

## Fedora için yükleme talimatları
[Başa dön](#gnulinux-da%C4%9F%C4%B1t%C4%B1m%C4%B1nda-prime-videoyu-hd-izleme-rehberi)

__Fedora 36__ için depoyu ekleyin
```
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/36/winehq.repo
```
__Fedora 35__ için depoyu ekleyin
```
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/35/winehq.repo
```
### wine-staging yükleyin
```
sudo dnf install winehq-staging
```

### winetricks yükleyin
```
sudo dnf install winetricks
```

# Google Chrome yüklemeden önce yapılacaklar

### winecfg programını açın ve Windows versiyonunuzun "Windows 7" olduğundan emin olun.
```
winecfg
```

Kaydedin ve çıkın

### dxvk yükleyin
```
winetricks -q dxvk
```

# Google Chrome yükleyin
Tarayıcınızın eklenti mağazasına gidin. "user agent switcher" aratmasını yapın ve çıkan eklentilerden birisini yükleyin. Eklediğiniz eklenti ile Windows kullanıyor gibi görünüp, Google Chrome'un Windows versiyonunu indirebileceğiz, diğer türlü Linux kullandığınızı algılayıp Linux için paketler öneriyor.

[Google Chrome](https://www.google.com/chrome/)

Google Chrome'u indirdiğiniz dizine gidin.
```
cd /dosya/yolu
```
Google Chrome'u wine ile çalıştırın ve yükleyin.
```
wine ChromeSetup.exe
```
Yükledikten sonra, masaüstünüze Google Chrome dosyası gelebilir. Bu dosyayı herhangi bir metin editörüyle düzenleyin. `Exec=` ile başlayan satırın sonuna `--no-sandbox` parametresini ekleyin ve kaydedin. Artık dosyayı çalıştırabilirsiniz.

Google Chrome'u masaüstünden değil de uygulama başlatıcınızdan çalıştırmak isterseniz aşağıdaki talimatları uygulayın.

`~/.local/share/applications/wine/Programs/Google\ Chrome.desktop` dosyasını nano editör ile açın.

```
nano ~/.local/share/applications/wine/Programs/Google\ Chrome.desktop
```

`Exec=` ile başlayan satırın sonuna `--no-sandbox` parametresini ekleyin ve kaydedin [Ctrl+X]. Artık uygulama başlatıcınızdan başlatabilirsiniz.


Örnek `~/.local/share/applications/wine/Programs/Google\ Chrome.desktop` dosyası.
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

# HD kalitenin keyfini çıkarın!


## Sorun giderme

### Primevideo eski bir tarayıcı kullandığınızı söyler ise
Google Chrome'u açın ve aşağıdaki adrese gidin.
```
chrome://components
```
Aşağı kaydırın, Widevine Component'ini bulun ve güncelleyin.
![image from components](https://imgur.com/eDiUHtTl.png "Widevine Component")

Güncelledikten sonra Google Chrome'u yeniden başlatın ve tekrar deneyin.
