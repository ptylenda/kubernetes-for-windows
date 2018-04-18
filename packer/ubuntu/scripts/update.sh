#!/bin/bash

apt-get -y update
apt-get -y dist-upgrade

echo 'ubuntu ALL=NOPASSWD:ALL' > /etc/sudoers.d/ubuntu