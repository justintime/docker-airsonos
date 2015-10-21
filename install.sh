#!/bin/bash

# Install what we can with apt

# Per https://github.com/docker/docker/issues/6345
# We have to do this for --net=host
#rm /usr/bin/chfn
#ln -s -f /bin/true /usr/bin/chfn

# nodetunes wants 0.12
curl -sL https://deb.nodesource.com/setup_0.12 | bash -

apt-get -q update && apt-get install -qy \
  build-essential \
  libavahi-compat-libdnssd-dev \
  libasound2-dev \
  git \
  nodejs

# Grab latest npm
sudo npm install npm -g

# Fix avahi-daemon not working without dbus
#sed -i -e "s#\#enable-dbus=yes#enable-dbus=false#g" /etc/avahi/avahi-daemon.conf
#sed -i -e "s/^rlimit-nproc/#rlimit-nproc/g" /etc/avahi/avahi-daemon.conf

npm config set color false
cd /var/tmp/
git clone https://github.com/stephen/airsonos.git
cd airsonos
# We pin a version here to help with drift/fragmentation
git reset --hard 479915684a8074b05e6c936b3438fbfa4889db49
npm install -g
