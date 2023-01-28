#!/bin/bash
set -e

mkdir /supervisor
chmod -R 777 /supervisor
dpkg --add-architecture i386
apt-get update
apt-get -y install python-is-python3 xvfb x11vnc xdotool wget tar supervisor net-tools fluxbox gnupg2
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
apt-get update
apt-get -y install winehq-stable
apt-get -y full-upgrade
apt-get clean
rm -rf /var/lib/apt/lists/*
LOCATION=$(wget -q -O - https://api.github.com/repos/novnc/novnc/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/novnc/novnc/archive/" substr($2, 2, length($2)-3) ".tar.gz"}')
wget -O - $LOCATION | tar -xzv -C .
mv ./noVNC* ./novnc
LOCATION=$(wget -q -O - https://api.github.com/repos/novnc/websockify/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/novnc/websockify/archive/" substr($2, 2, length($2)-3) ".tar.gz"}')
wget -O - $LOCATION | tar -xzv -C .
mv ./websockify* ./novnc/utils/websockify
ln -v ./novnc/vnc.html ./novnc/index.html
chmod -R 755 ./novnc

