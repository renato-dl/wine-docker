FROM ghcr.io/linuxserver/baseimage-selkies:ubunturesolute

ENV HOME=/config
ENV WINEPREFIX=${HOME}/prefix
ENV TITLE=wine-docker

COPY build.sh /
RUN chmod +x /build.sh && /build.sh && rm /build.sh

# selkies
COPY root /

VOLUME ${HOME}


