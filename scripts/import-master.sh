#!/usr/bin/env bash
set -e

readonly MASTER="EB42FFEC"

sudo gpg --no-default-keyring --keyring /etc/systemd/import-pubring.gpg --keyserver hkp://pgp.mit.edu --recv-keys "${MASTER}"

