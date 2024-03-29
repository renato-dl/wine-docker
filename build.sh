#!/bin/bash
set -e

dpkg --add-architecture i386
apt-get update
apt-get -y install wget
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
apt-get update
apt-get -y install winehq-stable
apt-get -y full-upgrade
apt-get clean
rm -rf /var/lib/apt/lists/*
