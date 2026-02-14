# EndeavourOS Install Requirements

This doc was written for Intel CPU / NVIDIA architecture with `systemd-boot` and `dracut`.

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

Add [these scripts](https://github.com/geotrev/linux-tinkerings/tree/main/scripts) to simplify maintenance (in `$HOME/scripts/`).

Further reading:
- [The idiots Guide to EndeavourOS by killajoe](https://github.com/killajoe/The_Idiots_Guide_to_EndeavourOS)
- [How to Use the Command `yay` (with examples) by CommandMasters](https://commandmasters.com/commands/yay-linux/)


### Note on synchronization

Some packages are chronically out of date with the AUR, such as Discord. Use an alternate source like flatpak instead (included in the update script).

## Optimizing mirrors

If `yay` is slow (5+ or even 10+ seconds), then it's probably due to a bad nameserver/route to repos.

Update `/etc/resolve.conf` with this to Go Fast™️:

```
nameserver 1.1.1.1
nameserver 1.0.0.1
```

## Monitor compatibility

Some monitors don't wake properly for EOS. Wake by turning on monitor is more consistent than mouse/keyboard.

Reading:

- [Environment Variables](https://invent.kde.org/plasma/kwin/-/wikis/Environment-Variables#kwin_drm_devices) (kwin_drm_devices)
- [Plasma Wayland Workaround](https://breadcat.run/blog/plasma-wayland-nvidia-lil-workaround/) by Breadcat
