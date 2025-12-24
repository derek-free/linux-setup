#!/bin/bash

echo "install-linux"

pacstrap -K /mnt base linux-lts linux-firmware-whence linux-firmware-intel sof-firmware sudo nano grub efibootmgr networkmanager bluez bluez-utils pipewire pipewire-pulse pipewire-alsa alsa-ucm-conf

genfstab -U /mnt >> /mnt/etc/fstab

cp *.sh /mnt/root/linux-setup

echo "arch-chroot /mnt"
