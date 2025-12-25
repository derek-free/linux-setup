#!/bin/bash

#update
sudo pacman -Syu
sudo pacman-key --init
sudo pacman-key --populate archlinux

#yay
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd

driver="mesa intel-ucode vulkan-intel intel-media-driver libva-intel-driver"
font="noto-fonts noto-fonts-cjk noto-fonts-emoji"
xorg="xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xprop"
extra="xautolock brightnessctl playerctl asusctl"
system="bspwm sxhkd polybar librewolf-bin xfe dmenu alacritty steam"

#install
yay -S $driver $font $xorg $extra $system

sudo cp ~/linux-setup/dotfiles/xorg.conf /etc/X11/
sudo cp ~/linux-setup/dotfiles/.xinitrc ~/
sudo cp ~/linux-setup/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
