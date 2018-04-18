#!/bin/bash

# Clean up
purge-old-kernels
apt-get -y autoremove --purge
apt-get -y clean

# Remove temporary files
rm -rf /tmp/*

# Delete unneeded files.
rm -f /home/ubuntu/*.sh

# Zero out free space
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

sync