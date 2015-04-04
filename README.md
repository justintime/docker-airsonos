# Summary
This is a Docker container for AirSonos.

AirSonos exposes Sonos as an AirPlay endpoint.  To learn more about AirSonos, [read the author's blog about it](https://medium.com/@stephencwan/hacking-airplay-into-sonos-93a41a1fcfbb).

# Installation
There isn't really any installation, but you need to have Docker installed.  Consult [the official Docker documentation ](https://docs.docker.com/installation/) for full details, but see below for Ubuntu 14.04.

## Install docker on Ubuntu 14.04
To install Docker on a fresh install of Ubuntu 14.04 Server:
``` bash
sudo su -
[ -e /usr/lib/apt/methods/https ] || {   apt-get update;  \
  apt-get install apt-transport-https; }
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get upgrade
apt-get install lxc-docker
```
# Running the airsonos container
The first run will pull the container image down to your local machine.

```
docker run -d --restart=always --net="host" --name="airsonos" -p 5000-5050:5000-5050/tcp -p 5000-5050:8000-8050/tcp justintime/airsonos
```

