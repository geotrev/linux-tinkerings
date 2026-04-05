#!/bin/bash
set -e

sudo reflector --protocol https --verbose --latest 20 --fastest 10 --sort age --save /etc/pacman.d/mirrorlist && eos-rankmirrors --verbose && yay -Syu
