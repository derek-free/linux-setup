#!/bin/bash

echo "linux"
pacstrap -K /mnt base linux-lts linux-firmware-whence linux-firmware-intel sof-firmware sudo nano grub efibootmgr networkmanager bluez bluez-utils pipewire pipewire-pulse pipewire-alsa alsa-ucm-conf

echo "genfstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "copy-script"
cp *.sh /mnt/root/linux-setup

echo "arch-chroot /mnt"
