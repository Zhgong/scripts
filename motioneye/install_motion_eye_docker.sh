#!/bin/bash
#
#
#
#
#
#
#

echo reference: https://github.com/ccrisan/motioneye/wiki/Install-In-Docker
#
#
#
#
# motioneye:master-armhf does NOT work with raspberry pi B+ (armv6l). Use cat /proc/cpuinfo or
# docker info to check architecture of rapspberry pi
#
#
#
#
#
#
# docker run --name="motioneye" \
#	-p 8765:8765 \
#	-p 8081:8081 \
#	--hostname="motioneye" \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /etc/motioneye:/etc/motioneye \
#	-v /var/lib/motioneye:/var/lib/motioneye \
#	--device=/dev/video0 \
#	ccrisan/motioneye:master-armhf
