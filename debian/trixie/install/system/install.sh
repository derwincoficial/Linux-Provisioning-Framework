#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "This script requires superuser privileges."
    echo "Run 'su -' or use 'sudo'."
    exit 1
fi

read -p "Enter the username: " USER_NAME

if [ -z "$USER_NAME" ]; then
    echo "A valid user must be specified."
    exit 1
fi

if ! id "$USER_NAME" >/dev/null 2>&1; then
    echo "The user does not exist on the system."
    exit 1
fi

rm -f /etc/apt/sources.list

tee /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware
EOF

apt -y update
apt -y full-upgrade

ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
echo "America/Bogota" > /etc/timezone

apt -y install chrony
systemctl enable --now chrony

apt -y install ca-certificates curl wget gnupg lsb-release

apt -y install nano less file dnsutils

apt -y install zip unzip tar gzip bzip2 xz-utils

apt -y install build-essential

usermod -aG sudo "$USER_NAME"

read -p "Do you want to reboot now? (y/n): " REBOOT_CONFIRM

if [[ "$REBOOT_CONFIRM" =~ ^[Yy]$ ]]; then
    reboot
fi
