#!/bin/bash

#update
sudo pacman -Syu
sudo pacman-key --init
sudo pacman-key --populate archlinux

#yay
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm
cd

driver="mesa intel-ucode vulkan-intel intel-media-driver libva-intel-driver"
font="noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji"
xorg="xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xprop"
extra="xautolock brightnessctl playerctl asusctl"
system="bspwm sxhkd polybar librewolf-bin xfe dmenu alacritty steam"

#install
yay -S --needed $driver $font $xorg $extra $system

sudo cp ~/linux-setup/dotfiles/.xinitrc ~/
sudo mkdir -p /etc/X11
sudo cp ~/linux-setup/dotfiles/xorg.conf /etc/X11/
sudo mkdir -p ~/.config/alacritty
sudo cp ~/linux-setup/dotfiles/alacritty.toml ~/.config/alacritty/
