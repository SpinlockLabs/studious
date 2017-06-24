#!/usr/bin/env bash
set -e

cd "$(dirname ${0})/.."

if [[ ! -f "build/rootfs.txz" ]]
then
  echo "ERROR: A rootfs has not been built."
  exit 1
fi

[[ -d build/assembly ]] && rm -rf build/assembly
mkdir -p build/assembly
cp build/rootfs.txz build/assembly/build.txz
cp configs/nspawn build/assembly/build.txz.nspawn
cd build/assembly
sha256sum -b * > SHA256SUMS
gpg --output SHA256SUMS.gpg --detach-sig SHA256SUMS
