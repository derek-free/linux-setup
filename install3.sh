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
git clone https://aur.archlinux.org/{bspwm,sxhkd,bspwmbar,librewolf-bin,rofi,rofi-bluetooth,rofi-file-browser-extended,alacritty,asusctl}.git


cd /tmp
git clone 'https://aur.archlinux.org/bspwm.git'
cd bspwm
makepkg -si --noconfirm
cd tmp
git clone 'https://aur.archlinux.org/sxhkd.git'
cd 'sxhkd'
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/bspwmbar.git'
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/librewolf.git'
cd /librewolf-bin
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/rofi.git'
cd /rofi
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/rofi-bluetooth.git'
cd /rofi-bluetooth
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/rofi-file-browser-extended.git'
cd rofi-browser-extended
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/alacritty.git'
cd /alacritty
makepkg -si --noconfirm
cd /tmp
git clone 'https://aur.archlinux.org/asusctl.git'
cd /asusctl
makepkg -si --noconfirm
cd


sudo cp ~/dotfiles/xorg.conf /etc/X11/
sudo cp ~/dotfiles/.xinitrc ~/
sudo cp ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
