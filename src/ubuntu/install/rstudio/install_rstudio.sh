#!/usr/bin/env bash
set -ex

# Install RStudio
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "${ARCH}" != "amd64" ]; then
  echo "only amd64 in debian/ubuntu supported"
  exit 1
else
wget -q https://https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.04.2-764-${ARCH}.deb -O rstudio-2024.04.2-764-${ARCH}.deb
apt-get update
apt-get install -y ./rstudio-2024.04.2-764-${ARCH}.deb

# Cleanup for app layer
chown -R 1000:0 $HOME
find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi

fi # not amd64
