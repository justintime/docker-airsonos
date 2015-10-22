# Summary
This is a Docker container for AirSonos.

AirSonos exposes Sonos as an AirPlay endpoint.  To learn more about AirSonos, [read the author's blog about it](https://medium.com/@stephencwan/hacking-airplay-into-sonos-93a41a1fcfbb).

# Installation
There isn't really any installation, but you need to have Docker installed.  Consult [the official Docker documentation ](https://docs.docker.com/installation/) for full details.

# Running the airsonos container
The first run will pull the container image down to your local machine.

``` bash
sudo docker run -d --restart=always --net="host" --name="airsonos" \
  -p 5000-5050:5000-5050/tcp justintime/airsonos
```

## Notes on running the container
Because the discovery mechanism uses mdns, you have to use ```--net="host"``` in order for discovery of your Sonos devices to work properly.  Since AirSonos binds to random ports between 5000 and 5050, it's best to publish them all.

