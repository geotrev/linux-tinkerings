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

Add [these scripts](https://github.com/geotrev/linux-tinkerings/tree/main/scripts) to simplify maintenance (in `$HOME/scripts/`). Make them executable.

- `sys-update.sh` - Run weekly
- `sys-cache.sh` - Run monthly
- `sys-mirrors.sh` - Run monthly

Further reading:
- [The idiots Guide to EndeavourOS by killajoe](https://github.com/killajoe/The_Idiots_Guide_to_EndeavourOS)
- [How to Use the Command `yay` (with examples) by CommandMasters](https://commandmasters.com/commands/yay-linux/)

## Package managers

Alternatives like flatpak and snap could be used if the AUR has unideal versions of packages. For example, Discord, which is often out of sync with the latest version from `discord.com`.

## Optimizing mirror speed

Sometimes updating mirrors isn't enough and `yay` is slow (like, 5-10s to fetch, slow). Likely this is due to a bad DNS default in the system. Likely because the DNS is inherited from your ISP.

Verify the speed like so: `time yay`. If it's longer than a few seconds, it's too slow. :)

<details>
<summary>How to fix</summary>

You can use NetworkManager for this.

First get the primary connection name. The name should match whatever your network manager GUI sees (e.g., "Wired connection 1").

```sh
$ nmcli connection show
```

Next, set your connection's DNS using `nmcli`. Two options here:
- Cloudflare: `1.1.1.1 1.0.0.1`
- IoT device (e.g. Pi-hole): `192.168.1.X`

```sh
$ nmcli connection modify "CONNECTION_NAME_HERE" ipv4.dns "IP_VALUE_HERE" ipv4.ignore-auto-dns yes
$ nmcli connection up "CONNECTION_NAME_HERE"
```

Reboot and verify the value in `/etc/resolv.conf` was set automatically.

---

You can undo this anytime by running:

```
nmcli connection modify "CONNECTION_NAME_HERE" ipv4.dns ""
nmcli connection modify "CONNECTION_NAME_HERE" ipv4.ignore-auto-dns no
nmcli connection up "CONNECTION_NAME_HERE"
```
</details>

## Disconnected ethernet

EOS can be fragile at times and rename your wired connection (undoing modified DNS configuration). Easiest path forward is to drop the connection and recreate it.

<details>
<summary>How to fix</summary>

If your connection was renamed, fully disconnect and remove it from Network settings first.

Then in terminal, get the interface name and connect to it (e.g., `enp1s1` or similar)

```sh
$ ip link show
$ nmcli device connect enp1s1
```

Then run the modify command in the previous section, refresh it, and reboot to confirm all is working.

</details>

## Monitor compatibility

Some monitors don't wake properly for EOS. Wake by turning on monitor is more consistent than mouse/keyboard.

[Debugging attempted]([url](https://bugs.kde.org/show_bug.cgi?id=514471))
