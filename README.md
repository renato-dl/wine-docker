# wine-docker
Docker image with Wine and VNC

Inspired by [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker)

## Instructions
* HOME_DIR: volume containing your supervisord.conf
* User provided with flag -u must own HOME_DIR
### Build and run
    docker build -t wine-docker .
    docker run -d -u user:group -p 8080:8080 -v <HOME_DIR>:/home/homedir --name wine-docker wine-docker

### Run from registry
    docker run -d -u user:group -p 8080:8080 -v <HOME_DIR>:/home/homedir --name wine-docker docker.pkg.github.com/renato-dl/wine-docker/wine-docker
