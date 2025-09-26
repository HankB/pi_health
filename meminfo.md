# meminfo

From `/proc/meminfo`, host w/out overlayfs

```text
hbarta@brandywine:~ $ cat /proc/meminfo
MemTotal:         437796 kB
MemFree:          126316 kB
MemAvailable:     338956 kB
Buffers:           21864 kB
Cached:           224656 kB
SwapCached:         2552 kB
Active:           168752 kB
Inactive:          92620 kB
Active(anon):      14932 kB
Inactive(anon):        4 kB
Active(file):     153820 kB
Inactive(file):    92616 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:        524284 kB
SwapFree:         505004 kB
Zswap:                 0 kB
Zswapped:              0 kB
Dirty:               220 kB
Writeback:             0 kB
AnonPages:         13536 kB
Mapped:            26872 kB
Shmem:                84 kB
KReclaimable:      22776 kB
Slab:              34824 kB
SReclaimable:      22776 kB
SUnreclaim:        12048 kB
KernelStack:        1016 kB
PageTables:         1736 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      743180 kB
Committed_AS:     190396 kB
VmallocTotal:     573440 kB
VmallocUsed:        7096 kB
VmallocChunk:          0 kB
Percpu:               64 kB
CmaTotal:         262144 kB
CmaFree:           94736 kB
hbarta@brandywine:~ $ 
```

From `/proc/meminfo`, host with overlayfs

```text
hbarta@puyallup:~ $ cat /proc/meminfo
MemTotal:         437804 kB
MemFree:          161112 kB
MemAvailable:     293232 kB
Buffers:           16052 kB
Cached:           150016 kB
SwapCached:            0 kB
Active:            55868 kB
Inactive:         167896 kB
Active(anon):      32780 kB
Inactive(anon):    25904 kB
Active(file):      23088 kB
Inactive(file):   141992 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Zswap:                 0 kB
Zswapped:              0 kB
Dirty:               860 kB
Writeback:             0 kB
AnonPages:         57708 kB
Mapped:            78832 kB
Shmem:               988 kB
KReclaimable:      24444 kB
Slab:              36088 kB
SReclaimable:      24444 kB
SUnreclaim:        11644 kB
KernelStack:         976 kB
PageTables:         1888 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      218900 kB
Committed_AS:     325956 kB
VmallocTotal:     573440 kB
VmallocUsed:        7168 kB
VmallocChunk:          0 kB
Percpu:               64 kB
CmaTotal:         262144 kB
CmaFree:          107392 kB
hbarta@puyallup:~ $ 
```