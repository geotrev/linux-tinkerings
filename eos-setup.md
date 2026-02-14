# EndeavourOS Install Requirements

This doc was written for Intel CPU / NVIDIA architecture with `systemd-boot` as boot manager.

Further reading:

- [The idiots Guide to EndeavourOS by killajoe](https://github.com/killajoe/The_Idiots_Guide_to_EndeavourOS)
- [How to Use the Command `yay` (with examples) by CommandMasters](https://commandmasters.com/commands/yay-linux/)

## Drivers

> NOTE: This won't be necessary with EOS Ganymede Neo, which provides sensible defaults OOTB.

Required for NVIDIA cards. After fresh endeavourOS install, restart into the fallback boot entry.

Install drivers:

```sh
$ yay -S nvidia-inst nvidia-hook
$ nvidia-inst
```

Reboot with the default boot entry and everything should render normally.

[endeavourOS Discovery Page](https://discovery.endeavouros.com/nvidia/new-nvidia-driver-installer-nvidia-inst/2022/03/)

## Maintenance scripts

Add [these scripts](https://github.com/geotrev/linux-tinkerings/tree/main/scripts) to simplify maintenance (in `$HOME/scripts/`). Inspired by the first link at the top.

## Optimizing mirrors

Your ISP probably gives a bad resolver path to the AUR, causing delays in package synchronization.

Update `/etc/resolve.conf` with this to Go Fast™️:

```
nameserver 1.1.1.1
nameserver 1.0.0.1
```

## Discord

Install discord separately with flatpak because it's chronically out of sync with AUR.

## Monitor compatibility

Wake system by turning on monitor. Avoid wake-on-USB.

[See this gist.](https://gist.github.com/geotrev/b61ec237717b2189a495a12adce619aa)

Reading:

- [Environment Variables](https://invent.kde.org/plasma/kwin/-/wikis/Environment-Variables#kwin_drm_devices) (kwin_drm_devices)
- [Plasma Wayland Workaround](https://breadcat.run/blog/plasma-wayland-nvidia-lil-workaround/) by Breadcat
