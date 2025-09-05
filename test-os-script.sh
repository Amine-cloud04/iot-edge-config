#!/bin/bash

# Script pour reproduire les tests d'images OS
# Auteur : Amine Mimis

echo "=== Téléchargement des images ==="

# Debian Live
echo "Téléchargement Debian Live..."
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.0.0-amd64-gnome.iso -O debian-live.iso

# Ubuntu Core
echo "Téléchargement Ubuntu Core..."
wget -c https://cdimage.ubuntu.com/ubuntu-core/24/stable/current/ubuntu-core-24-amd64.img.xz -O ubuntu-core-24-amd64.img.xz

# Yocto (exemple placeholder)
echo "Yocto : nécessite build manuel. Cloner poky et builder manuellement."

# NixOS
echo "Téléchargement NixOS..."
wget -c https://channels.nixos.org/nixos-23.05/latest-nixos-minimal-x86_64-linux.iso -O nixos.iso

echo "=== Préparation des images ==="
echo "Décompression Ubuntu Core..."
unxz ubuntu-core-24-amd64.img.xz

echo "=== Instructions flash manuelles ==="
echo "Utiliser Balena Etcher ou la commande dd pour écrire les images sur clé USB ou disque."

echo "=== Fin du script ==="
