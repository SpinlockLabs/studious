#!/usr/bin/env bash
set -e

cd "$(dirname ${0})/.."

PKGS=($(cat configs/packages | grep -v -e "^#" -e "^$" | tr '\n' ' '))

[[ -d build/rootfs ]] && echo "Cleaning up after last build..." && sudo rm -rf build/rootfs
mkdir -p build/rootfs
sudo pacstrap -C configs/pacman.conf -d build/rootfs "${PKGS[@]}"
sudo cp -R overlay/* build/rootfs
sudo arch-chroot build/rootfs /cinit.sh
cd build/rootfs
sudo tar cpJf ../rootfs.txz . --one-file-system
