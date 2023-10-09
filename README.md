# wine-docker
Docker image with Wine and VNC

Based on [KasmVNC Base Images from LinuxServer](https://github.com/linuxserver/docker-baseimage-kasmvnc)

## Instructions
* HOME_DIR: volume containing the wine prefix directory
* PUID and PGID assigned to container user (`abc`) must have permission to access HOME_DIR
### Build and run
    docker build -t wine-docker .
    docker run -d -e PUID=1000 -e PGID=1000 -p 3000:3000 -v HOME_DIR:/config --name wine-docker wine-docker

### Run from registry
    docker run -d -e PUID=1000 -e PGID=1000 -p 3000:3000 -v HOME_DIR:/config --name wine-docker docker.pkg.github.com/renato-dl/wine-docker/wine-docker
