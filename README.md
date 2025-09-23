# pi_health

Monitor Raspbery Pi health parameters

## Motivation

Some of my Raspberry Pis refuse to continue to operate and have resisted attempts to determine the source of the malfunctions. Monitoring `dmesg` has not produced a definitive answer using <https://github.com/HankB/dmesg_saver>.

## Parameters

|value|description|typical|units|source|notes|
|---|---|---|---|---|---|
|rssi|WiFi signal strength|-66|dB||and other WiFi parameters|
|CPU_temp|CPU temperature|45|°C|||
|various memory|||||needs research|
|disk space|||||needs research|
|CPU_threads|||||x|
|CPU_utilization|||||top: us, sy, ni, id, wa, hi, si, st|
|CPU_load|||||x|
|CPU_voltage|||||x|
||||||x|

Question: Sample periodically or sample more frequently and collect average, high and low? Seems particularly useful for things like CPU utilization.

## Plan

Collect the parameters, format as JSON and publish to MQTT broker. The published packet will include a timestamp and the topic will include the hostname. Values will be collected as near to the source as possible to reduce the processing load. Likewise, calculations will be pushed to the subscriber (for example, report memory usage and total memory in MB and not calculate % use.)

## Research

It's silly to assume I'm the first to want something like this.

* <https://picockpit.com/raspberry-pi/pidoctor-raspberry-pi-system-health-monitor/>
* <https://raspberrytips.com/monitor-raspberry-pi-performance/>
* <https://www.youtube.com/watch?v=7lXjJefo7bI>
* <https://github.com/roger-/hass-sysmon>
* <https://github.com/timmo001/system-bridge>
* <https://community.home-assistant.io/t/how-to-monitor-system-resources-on-another-pi/32657/12>

## Sources

Preference goes to entries in `/proc` or `/sys` filesystems. Another source is the command `vcgencmd` which fetches information from the "VideoCore GPU". An number of commands are [listed here](./vcgencmd.md).

### Wireless

```text
hbarta@brandywine:~ $ cat /proc/net/wireless
Inter-| sta-|   Quality        |   Discarded packets               | Missed | WE
 face | tus | link level noise |  nwid  crypt   frag  retry   misc | beacon | 22
 wlan0: 0000   51.  -59.  -256        0      0      0    189      0        0
hbarta@brandywine:~ $
```

Alternate `iwlist wlan0 scanning`.

### Temperature

Thousandths of a degree. (e.g. °C x 1000.)

```text
hbarta@brandywine:~ $ cat /sys/class/thermal/thermal_zone0/temp
45464
hbarta@brandywine:~ $ 
```

Alternate `vcgencmd measure_temp`.

### Memory

[`cat /proc/meminfo`](./meminfo.md).

Alternate `free` or `free -m`.

Find high memory processes `ps aux --sort=-%mem | head -n 10`

### Disk

Raw information can probably be sussed from `/sys/block` but it seems more fruitful to use [output of `df`](./df.md). 


