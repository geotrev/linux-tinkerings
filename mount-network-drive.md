TL;DR creating an SMB connection in Dolphin is _not_ the same as mounting the network folder in your file system.

Mount the drive to local file system for things like accessing files in apps reliably.

# Steps

1. Created a mount point (in this case: `/mnt/nas/music`
2. My NAS has credentials so I created a file for that: `/root/.smbcredentials` with contents like this:

```
username=xxxxxx
password=xxxxxx
```

3. Then set permissions on the file (based on what I saw others doing, seems fair): `sudo chmod 600 /root/.smbcredentials`

4. Tested the mount:

```
$ sudo mount -t cifs //192.168.x.x/Shared/Music /mnt/nas/music -o credentials=/root/.smbcredentials
```

5. After confirming this works (`sudo ls /mnt/nas/music`), I unmounted the drive: `sudo umount /mnt/nas/music`

6. Then added a new fstab entry to make it official (again, based on some resources I was reading):

```
//192.168.x.x/Shared/Music /mnt/nas/music cifs credentials=/root/.smbcredentials,uid=1000,gid=1000,file_mode=0755,dir_mode=0755 0 0
```

7. Restart daemons: `sudo systemctl daemon-reload`
