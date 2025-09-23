# meminfo

From `/proc/meminfo`

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