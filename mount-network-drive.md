## Mount a network drive

1. Create a mount point (e.g. `/mnt/nas/media`
2. If credentials required, create them in `/root/.smbcredentials`:

```
username=xxxxxx
password=xxxxxx
```

3. Set permissions on the file: `sudo chmod 600 /root/.smbcredentials`

4. Test the mount:

```
$ sudo mount -t cifs //192.168.x.x/media /mnt/nas/media -o credentials=/root/.smbcredentials
```

5. If files appeared in the directory, success; now unmount the drive: `sudo umount /mnt/nas/media`

6. Add an fstab entry to make it official:

```
//192.168.x.x/media /mnt/nas/media cifs credentials=/root/.smbcredentials,uid=1000,gid=1000,file_mode=0755,dir_mode=0755 0 0
```

7. Remount drives: `sudo mount -a`
