# pi_health

Monitor Raspbery Pi health parameters

## Motivation

Some of my Raspberry Pis refuse to continue to operate and have resisted attempts to determine the source of the malfunctions. Monitoring `dmesg` has not produced a definitive answer using <https://github.com/HankB/dmesg_saver>.

## Parameters

|value|description|typical|units|source|notes|
|---|---|---|---|---|---|
|rssi|WiFi signal strength|-66|dB|||
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