#!/bin/bash

#date
read -p 'region: ' region
read -p 'city: ' city
ln -sf /usr/share/zoneinfo/$region/$city /etc/localtime
hwclock --systohc

#locale
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
locale-gen

#hostname
echo 'archlinux' > /etc/hostname

#hosts
echo '127.0.0.1 localhost' > /etc/hosts
echo '::1 localhost' >> /etc/hosts
echo '127.0.0.1 archlinux' >> /etc/hosts

#hosts-genshin
echo '0.0.0.0 sg-public-data-api.hoyoverse.com' >> /etc/hosts
echo '0.0.0.0 log-upload-os.hoyoverse.com' >> /etc/hosts

#password-root
passwd

#password-user
read -p 'user: ' user
useradd -m -G wheel -s /bin/bash $user
passwd $user

#rule-wheel
echo '%wheel ALL=(ALL:ALL) ALL' >> /etc/sudoers

#grub
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot
echo 'GRUB_DEFAULT=0' > /etc/default/grub
echo 'GRUB_TIMEOUT=0' >> /etc/default/grub
echo 'GRUB_DISTRIBUTOR="Arch"' >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet intel_idle.max_cstate=1"' >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX=""' >> /etc/default/grub
echo 'GRUB_PRELOAD_MODULES="part_gpt part_msdos"' >> /etc/default/grub
echo 'GRUB_TIMEOUT_STYLE=hidden' >> /etc/default/grub
echo 'GRUB_GFXMODE=auto' >> /etc/default/grub
echo 'GRUB_GFXPAYLOAD_LINUX=keep' >> /etc/default/grub
echo 'GRUB_DISABLE_RECOVERY=true' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

#multilib
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

#systemctl
systemctl enable NetworkManager bluetooth

#move-script
mv /root/linux-setup /home/$user/
chown -R $user:$user /home/$user/linux-setup

clear
echo 'exit & reboot'
