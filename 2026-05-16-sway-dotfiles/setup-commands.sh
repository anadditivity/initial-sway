#!/bin/bash
function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

sudo pacman -Sy artix-archlinux-support

yes_or_no "Have you added the following to /etc/pacman.conf after [galaxy]:

[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

(y/n)
"

sudo pacman-key --populate archlinux

yes_or_no "Install Sway? (y/n)" && sudo pacman -Sy sway

sudo pacman -Sy git nano vim wget rofi mousepad mako brightnessctl \
    network-manager-applet blueman wdisplays pcmanfm file-roller 7zip arj binutils bzip3 \
    cdrtools cpio lhasa lrzip rpmextract squashfs-tools unace unrar unzip zip \
    grim swappy obs-studio xdg-desktop-portal-wlr xdg-desktop-portal \
    swaybg tealdeer feh swayidle swaylock mpv mpd ttf-jetbrains-mono-nerd \
    ttf-nerd-fonts-symbols otf-font-awesome foot waybar firefox
    --needed

#paru -Sy sfwbar --needed

# INTEL-SPECIFIC!
if inxi -G | grep -i 'intel' -q ; 
then
    sudo pacman -S libva-intel-driver 
fi

fc-cache -fv
xdg-user-dirs-update
tldr --update

# the artixinstall does add thunar, which is unnecessary for me
sudo pacman -Rc thunar
