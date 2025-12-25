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
font="noto-fonts noto-fonts-cjk noto-fonts-emoji"
xorg="xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xprop"
extra="xautolock brightnessctl playerctl"
#system="bspwm sxhkd librewolf alacritty xfe steam asusctl"

#install
sudo pacman -S --needed $driver $font $xorg $extra

#aur
cd /tmp
git clone 'https://aur.archlinux.org/bspwm-git.git'
git clone 'https://aur.archlinux.org/sxhkd-git.git'
git clone 'https://aur.archlinux.org/polybar-git.git'
git clone 'https://aur.archlinux.org/librewolf-bin.git'
git clone 'https://aur.archlinux.org/alacritty-git.git'
#git clone 'https://aur.archlinux.org/asusctl.git'


cd 'bspwm-git' && makepkg -si && cd '/tmp'
cd 'sxhkd-git' && makepkg -si && cd '/tmp'
cd 'polybar-git' && makepkg -si && cd '/tmp'
cd 'librewolf-bin' && makepkg -si && cd '/tmp'
cd 'alacritty-git' && makepkg -si && cd '/tmp'
#cd 'asusctl' && makepkg -si && cd '/tmp'

sudo cp ~/linux-setup/dotfiles/xorg.conf /etc/X11/
sudo cp ~/linux-setup/dotfiles/.xinitrc ~/
sudo cp ~/linux-setup/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
