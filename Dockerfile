FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble

ENV HOME /config
ENV WINEPREFIX ${HOME}/prefix32
ENV WINEARCH win32
ENV TITLE wine-docker

COPY build.sh /
RUN chmod +x /build.sh && /build.sh && rm /build.sh

# kasmvnc
COPY root /

VOLUME ${HOME}


