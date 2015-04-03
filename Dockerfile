# use 12.04 precise (https://github.com/docker/docker/issues/5899)
FROM phusion/baseimage:0.9.9
MAINTAINER Justin Ellison <justin@techadvise.com>

# Set correct environment variables.
ENV DEBIAN_FRONTEND noninteractive
# Set correct environment variables
ENV HOME /root

ADD . /build

RUN /build/prepare.sh && \
	/build/install.sh && \
	/build/cleanup.sh

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

EXPOSE 5000 5001 5002 5003 5004 5005 5006 5006 5007 5008 5009 5010 5011 5012 5013 5014 5015

ADD init/ /etc/my_init.d/
ADD services/ /etc/service/

