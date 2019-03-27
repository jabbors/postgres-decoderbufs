#!/bin/bash

echo "Build for Ubuntu 18 and PostgreSQL 10"
cd ubuntu18-pg10
rm -f postgresql-10*
docker run -it --rm -v ${PWD}:/mnt/host ubuntu:18.04 /mnt/host/build.sh
cd -
echo "Build for Ubuntu 18 and PostgreSQL 11"
cd ubuntu18-pg11
rm -f postgresql-11*
docker run -it --rm -v ${PWD}:/mnt/host ubuntu:18.04 /mnt/host/build.sh
cd -
