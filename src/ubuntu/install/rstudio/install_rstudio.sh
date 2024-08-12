#!/usr/bin/env bash
set -ex

# Install RStudio
wget -q https://https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.04.2-764-amd64.deb -O rstudio-2024.04.2-764-amd64.deb
apt-get update
apt-get install -y ./rstudio-2024.04.2-764-amd64.deb

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

