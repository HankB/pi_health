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

### CPU usage (%)

* <https://stackoverflow.com/questions/23367857/accurate-calculation-of-cpu-usage-given-in-percentage-in-linux>
* <https://www.idnt.net/en-US/kb/941772>
* <https://man7.org/linux/man-pages/man5/proc_stat.5.html>

Numbers are in `/proc/stat` or parse the output from `top` or similar.

### CPU Load

* <https://superuser.com/questions/1402079/understanding-load-average-and-cpu-in-linux>
* <https://www.linuxjournal.com/article/9001>

```text
hbarta@brandywine:~ $ cat /proc/loadavg
0.76 0.77 0.70 2/121 23978
hbarta@brandywine:~ $ 
```

### CPU Voltage

* See man page for details

`vcgencmd measure_volts` and `vcgencmd get_throttled`

## Implementation

* Some params can be read directly from pseudo-filesystems `/proc`/ and `/sys`. These are all text.
* Some parameters can be collected from system commands, again text.
* %CPU from `/proc/stat` requires processing beyond just reading a value. That processing is already performed by `top`.
* Particularly WRT a Pi Zero, it is important to minimize processing requirements to avoid overloading the host with monitoring.

With the ease that a `bash` script provides for extracting information frrom files and the output of commands, that seems to be the easiest option to implement. The first cut will use that with the plan that a compiled langiage could be used for a second generation should the back process use too much CPU.

### bash

Done in a subdirectory and the general structure will be:

* There will be a bash function for each source and these will be in a file that can be sourced by a test script or the actual driver script.
* A command line argument will be provided to identify the source, either a file name or a command.
* Each function will write a string to standard out consisting of a single line formatted suitably to be included in a JSON package.
* A test driver will be provided for development purposes that will mock the inputs.
* Any required diagnostics will be written to standard error.
