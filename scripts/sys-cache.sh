#!/bin/bash
set -e

# journalctl --vacuum-time -> clear journal entries from >1 month old
# yay -Yc -> removes orphaned packages
# yay -Sc -> removes old packages from cache directory

sudo journalctl --vacuum-time=4weeks && yay -Yc && yay -Sc
