#!/usr/bin/env bash
set -e

readonly MASTER="EB42FFEC"
readonly GPG_CMD="sudo gpg --no-default-keyring --keyring /etc/systemd/import-pubring.gpg --keyserver hkp://pgp.mit.edu"

${GPG_CMD} --recv-keys "${MASTER}"
echo -e "trust\n5\ny\n" | ${GPG_CMD} --command-fd 0 --edit-key "${MASTER}" > /dev/null 2>&1
