#!/bin/bash

echo "yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
rm -rf yay

driver="mesa intel-ucode vulkan-intel intel-media-driver libva-intel-driver"
font="noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji"
xorg="xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xsetroot xorg-xprop"
system="bspwm sxhkd librewolf rofi rofi-bluetooth rofi-network-manager alacritty xfe xautolock brightnessctl playerctl asusctl"

echo "install"
yay -S --needed $driver $font

echo "update"
yay -Syu --noconfirm

echo "install"
yay -S --needed $xorg $system

sudo 
