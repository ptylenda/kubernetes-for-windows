#!/bin/bash

if [[ $PACKER_BUILDER_TYPE =~ hyperv-iso ]]; then
  # gen 2 EFI fix - see https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/supported-ubuntu-virtual-machines-on-hyper-v
  cp -r /boot/efi/EFI/ubuntu/ /boot/efi/EFI/boot
  mv /boot/efi/EFI/boot/shimx64.efi /boot/efi/EFI/boot/bootx64.efi
fi
