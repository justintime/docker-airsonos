#!/bin/bash

# Install what we can with apt

# Per https://github.com/docker/docker/issues/6345
# We have to do this for --net=host
#rm /usr/bin/chfn
#ln -s -f /bin/true /usr/bin/chfn

curl -sL https://deb.nodesource.com/setup | sudo bash -

apt-get -q update && apt-get install -qy \
  build-essential \
  libavahi-compat-libdnssd-dev \
  libasound2-dev \
  git \
  nodejs

# Fix avahi-daemon not working without dbus
#sed -i -e "s#\#enable-dbus=yes#enable-dbus=false#g" /etc/avahi/avahi-daemon.conf
#sed -i -e "s/^rlimit-nproc/#rlimit-nproc/g" /etc/avahi/avahi-daemon.conf

npm install -g babel

cd /var/tmp/
git clone https://github.com/justintime/airsonos
cd airsonos
npm install -g --unsafe-perm
