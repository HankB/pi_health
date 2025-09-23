# pi_health

Monitor Raspbery Pi health parameters

## Motivation

Some of my Raspberry Pis refuse to continue to operate and have resisted attempts to determine the source of the malfunctions. Monitoring `dmesg` has not produced a definitive answer using <https://github.com/HankB/dmesg_saver>.

## Parameters

|value|description|typical|units|source|notes|
|---|---|---|---|---|---|
|rssi|WiFi signal strength|-66|dB|||
|CPU_temp|CPU temperature|45|°C|||
