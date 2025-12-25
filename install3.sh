#!/bin/bash

#update
sudo pacman -Syu --noconfirm

#yay
#cd /tmp
#git clone https://aur.archlinux.org/yay-bin.git
#cd /yay-bin
#makepkg -si --noconfirm
#cd

driver="mesa intel-ucode vulkan-intel intel-media-driver libva-intel-driver"
font="noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji"
xorg="xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xprop"
extra="xautolock brightnessctl playerctl"
system="bspwm sxhkd librewolf rofi rofi-bluetooth rofi-network-manager alacritty xfe steam  brightnessctl playerctl asusctl"

#install
sudo pacman -S --needed $driver $font $xorg $extra

#aur
cd /tmp
git clone 'https://aur.archlinux.org/bspwm.git'
git clone 'https://aur.archlinux.org/sxhkd.git'
git clone 'https://aur.archlinux.org/bspwmbar.git'
git clone 'https://aur.archlinux.org/librewolf-bin.git'
git clone 'https://aur.archlinux.org/rofi.git'
git clone 'https://aur.archlinux.org/rofi-bluetooth.git'
git clone 'https://aur.archlinux.org/rofi-file-browser-extended.git'
git clone 'https://aur.archlinux.org/alacritty}.git'
git clone 'https://aur.archlinux.org/asusctl}.git'


cd 'bspwm' && makepkg -si --noconfirm && cd '/tmp'
cd 'sxhkd' && makepkg -si --noconfirm && cd '/tmp'
cd 'bspwmbar' && makepkg -si --noconfirm && cd '/tmp'
cd 'librewolf-bin' && makepkg -si --noconfirm && cd '/tmp'
cd 'rofi' && makepkg -si --noconfirm && cd '/tmp'
cd 'rofi-bluetooth' && makepkg -si --noconfirm && cd '/tmp'
cd 'rofi-file-browser-extended' && makepkg -si --noconfirm && cd '/tmp'
cd 'alacritty' && makepkg -si --noconfirm && cd '/tmp'
cd 'asusctl' && makepkg -si --noconfirm && cd '/tmp'

rm -rf {bspwm,sxhkd,bspwmbar,librewolf-bin,rofi,rofi-bluetooth,rofi-file-browser-extended,alacritty,asusctl}
cd

sudo cp ~/dotfiles/xorg.conf /etc/X11/
sudo cp ~/dotfiles/.xinitrc ~/
sudo cp ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
