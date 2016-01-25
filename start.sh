#!/bin/sh

# Make sure to add the following entry in /etc/default/grub:
#GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"

# docker daemon --storage-driver=overlay
#docker info
#docker pull debian

# building:
#docker build -t docker-test .
#docker run --name docker-test-run -i -t docker-test

# manually:
#docker run -P -i -t --name=docker-test debian /bin/bash
#docker ps -a
#docker commit docker-test
#docker rmi docker-test

