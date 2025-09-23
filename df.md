# df

Examples for read/write host and overlayfs host.

```text
hbarta@brandywine:~ $ df
Filesystem     1K-blocks    Used Available Use% Mounted on
udev               84512       0     84512   0% /dev
tmpfs              43780     992     42788   3% /run
/dev/mmcblk0p2  44468744 4046860  38144792  10% /
tmpfs             218896       0    218896   0% /dev/shm
tmpfs               5120       8      5112   1% /run/lock
/dev/mmcblk0p3  16337876      64  15482568   1% /mnt/dmesg
/dev/mmcblk0p1    522230   82064    440166  16% /boot/firmware
tmpfs              43776       0     43776   0% /run/user/1000
hbarta@brandywine:~ $ 
```

```text
hbarta@puyallup:~ $ df
Filesystem     1K-blocks    Used Available Use% Mounted on
udev               82112       0     82112   0% /dev
tmpfs              87564     972     86592   2% /run
/dev/mmcblk0p2   7082208 5420004   1284148  81% /media/root-ro
tmpfs-root        218900   24664    194236  12% /media/root-rw
overlayroot       218900   24664    194236  12% /
tmpfs             218900       0    218900   0% /dev/shm
tmpfs               5120       8      5112   1% /run/lock
/dev/mmcblk0p1    522232  100206    422026  20% /boot/firmware
tmpfs              43780       0     43780   0% /run/user/1000
hbarta@puyallup:~ $ 
```
