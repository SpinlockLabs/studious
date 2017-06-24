#!/usr/bin/env bash
set -e

if [[ $(realpath ${0}) != "/cinit.sh" ]]
then
  echo "ERROR: Do not run this script manually, ever. Your children will die."
  exit 1
fi

function pkgctl() {
  pacman --noconfirm "${@}"
}

pkgctl -R --cascade linux linux-firmware mkinitcpio
pkgctl -Scc
systemctl enable systemd-networkd systemd-resolved
umount /etc/resolv.conf >/dev/null 2>&1 || true
unlink /etc/resolv.conf
ln -s /usr/share/systemd/resolv.conf /etc/resolv.conf

rm -rf /boot
rm "${0}"
