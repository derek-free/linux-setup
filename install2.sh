#!/bin/bash

#date
ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
hwclock --systohc

#locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

#hostname
echo "archlinux" > /etc/hostname

#hosts
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 archlinux" >> /etc/hosts

#genshin_fix
echo "0.0.0.0 sg-public-data-api.hoyoverse.com" >> /etc/hosts
echo "0.0.0.0 log-upload-os.hoyoverse.com" >> /etc/hosts

#root_password
echo "root:mahou" | chpasswd

#user
passwd
useradd -m -G wheel -s /bin/bash derek_inc
echo "derek_inc:mahou" | chpasswd

#wheel_rule
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

#grub
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager bluetooth

echo "exit & reboot"
