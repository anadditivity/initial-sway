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

yes_or_no "Install Sway? (y/n)" && sudo pacman -Sy sway

sudo pacman -Sy git wget rofi mousepad mako brightnessctl network-manager-applet \
    blueman wdisplays pcmanfm file-roller 7zip arj binutils bzip3 \
    cdrtools cpio lhasa lrzip rpmextract squashfs-tools unace unrar unzip zip \
    grim swappy obs-studio xdg-desktop-portal-wlr xdg-desktop-portal \
    swaybg tealdeer feh swayidle swaylock mpv mpd ttf-jetbrains-mono-nerd \
    ttf-nerd-fonts-symbols otf-font-awesome
    --needed

paru -Sy sfwbar --needed

# INTEL-SPECIFIC!
if inxi -G | grep -i 'intel' -q ; 
then
    sudo pacman -S libva-intel-driver 
fi

fc-cache -fv
xdg-user-dirs-update
tldr --update
