#!/bin/bash

set -e

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing necessary packages..."
sudo apt install -y ufw fail2ban chkrootkit aide python3 python3-pip docker.io docker-compose

echo "[+] Configuring firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

echo "[+] Creating user 'edgeuser'..."
sudo useradd -m -s /bin/bash edgeuser || true

echo "[+] Installation complete. Please configure SSH keys manually for 'edgeuser'."
