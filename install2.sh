#!/bin/bash

echo "date"
ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
hwclock --systohc

echo "locale"
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

echo "hostname"
echo "archlinux" > /etc/hostname

echo "host"
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 archlinux" >> /etc/hosts

echo "host-genshin"
echo "0.0.0.0 sg-public-data-api.hoyoverse.com" >> /etc/hosts
echo "0.0.0.0 log-upload-os.hoyoverse.com" >> /etc/hosts

echo "password-root"
echo "root:mahou" | chpasswd

echo "password-user"
useradd -m -G wheel -s /bin/bash derek_inc
echo "derek_inc:mahou" | chpasswd

echo "rule-wheel"
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "grub"
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

echo "systemctl"
systemctl enable NetworkManager bluetooth

mv /root/linux-setup /home/derek_inc/
chown -R derek_inc:derek_inc /home/derek_inc/linux-setup

echo "exit & reboot"
