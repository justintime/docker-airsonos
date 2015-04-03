#!/bin/bash


# Clean up APT when done.
apt-get -y purge build-essential 
apt-get -y autoremove 
apt-get clean 
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
