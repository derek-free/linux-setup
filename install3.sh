#!/bin/bash

#update
sudo pacman -Syu

yay
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd /yay-bin
makepkg -si --noconfirm
cd

driver="mesa intel-ucode vulkan-intel intel-media-driver libva-intel-driver"
font="noto-fonts noto-fonts-cjk noto-fonts-emoji"
xorg="xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xprop"
extra="xautolock brightnessctl playerctl asusctl"
system="bspwm polybar sxhkd librewolf-bin alacritty steam"

#install
yay -S $driver $font $xorg $extra $system

#aur
cd /tmp
git clone 'https://aur.archlinux.org/bspwm-git.git'
git clone 'https://aur.archlinux.org/sxhkd-git.git'
git clone 'https://aur.archlinux.org/polybar-git.git'
git clone 'https://aur.archlinux.org/librewolf-bin.git'
git clone 'https://aur.archlinux.org/alacritty-git.git'
#git clone 'https://aur.archlinux.org/asusctl.git'

sudo cp ~/linux-setup/dotfiles/xorg.conf /etc/X11/
sudo cp ~/linux-setup/dotfiles/.xinitrc ~/
sudo cp ~/linux-setup/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
