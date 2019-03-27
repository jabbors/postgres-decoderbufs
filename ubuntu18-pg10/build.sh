#!/bin/bash

PLUGIN_VERSION=v0.9.3.Final
POSTGRES_VERSION=10

# Dependencies for compiling
apt-get update && apt-get install -y \
    software-properties-common \
    build-essential \
    pkg-config \
    git \
    libproj-dev \
    liblwgeom-dev \
    libprotobuf-c-dev

# Install postgres from upstream packages
apt-get install -y wget gnupg2
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update && apt-get install -y postgresql-server-dev-${POSTGRES_VERSION}

# Dependencies for packaging
apt-get install -y \
    devscripts \
    lintian \
    debhelper

git clone https://github.com/debezium/postgres-decoderbufs -b ${PLUGIN_VERSION} --single-branch \
    && cd /postgres-decoderbufs \
    && cp -r /mnt/host/debian . \
    && debuild -us -uc \
    && cd / \
    && cp postgresql-${POSTGRES_VERSION}* /mnt/host
