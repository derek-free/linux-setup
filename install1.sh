#!/bin/bash

#linux
pacstrap -K /mnt base linux-lts linux-firmware sof-firmware base-devel sudo nano grub efibootmgr git networkmanager bluez bluez-utils pipewire pipewire-pulse pipewire-alsa alsa-ucm-conf

#genfstab
genfstab -U /mnt >> /mnt/etc/fstab

#bluetooth
echo 'AutoEnable=true' >> /etc/bluetooth/main.conf
echo 'FastConnectable=true' >> /etc/bluetooth/main.conf

#copy-script
mkdir -p /mnt/root/linux-setup
cp -a ~/linux-setup/. /mnt/root/linux-setup

clear
echo 'arch-chroot /mnt'
