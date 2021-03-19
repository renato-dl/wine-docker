FROM ubuntu:latest

ENV HOME /home/homedir
ENV WINEPREFIX ${HOME}/prefix32
ENV WINEARCH win32
ENV DISPLAY :0

COPY build.sh /
RUN chmod +x /build.sh && /build.sh && rm /build.sh

VOLUME ${HOME}

EXPOSE 8080

USER nobody

CMD /usr/bin/supervisord -c $HOME/supervisord.conf
