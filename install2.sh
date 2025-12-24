#!/bin/bash

echo "date"
ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
hwclock --systohc

echo "locale"
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
locale-gen

echo "hostname"
echo 'archlinux' > /etc/hostname

echo "host"
echo '127.0.0.1 localhost' > /etc/hosts
echo '::1 localhost' >> /etc/hosts
echo '127.0.0.1 archlinux' >> /etc/hosts

echo "host-genshin"
echo '0.0.0.0 sg-public-data-api.hoyoverse.com' >> /etc/hosts
echo '0.0.0.0 log-upload-os.hoyoverse.com' >> /etc/hosts

echo "password-root"
echo 'root:mahou' | chpasswd

echo "password-user"
useradd -m -G wheel -s /bin/bash derek_inc
echo 'derek_inc:mahou' | chpasswd

echo "rule-wheel"
echo '%wheel ALL=(ALL:ALL) ALL' >> /etc/sudoers

echo "grub"
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

echo "systemctl"
systemctl enable NetworkManager bluetooth

echo "move-script"
mv /root/linux-setup /home/derek_inc/
chown -R derek_inc:derek_inc /home/derek_inc/linux-setup

echo "exit & reboot"
