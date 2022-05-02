#!/bin/bash

set -euo pipefail

log() {
  logger "$*"
  echo "$*"
}

log "Running custom bootstrap script for $(hostname)"

source /etc/os-release
KERNEL_RELEASE="$(uname -r)"
echo "deb http://deb.debian.org/debian ${VERSION_CODENAME}-backports contrib non-free" > /etc/apt/sources.list.d/zfs.list
apt-get update
apt-get install -y lz4 "linux-headers-${KERNEL_RELEASE}"
DEBIAN_FRONTEND=noninteractive apt-get install -y -t "${VERSION_CODENAME}-backports" zfs-dkms --no-install-recommends
modprobe zfs
apt-get install -y -t "${VERSION_CODENAME}-backports" zfsutils-linux

log "Finished custom bootstrap script for $(hostname)"
