#!/bin/bash

echo "linux"
pacstrap -K /mnt base linux-lts linux-firmware sof-firmware sudo nano grub efibootmgr git networkmanager bluez bluez-utils pipewire pipewire-pulse pipewire-alsa alsa-ucm-conf

echo "genfstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "copy-script"
mkdir -p /mnt/root/linux-setup
cp *.sh /mnt/root/linux-setup

echo "arch-chroot /mnt"
