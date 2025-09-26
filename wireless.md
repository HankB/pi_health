# /proc/net/wireless

Google AI overview lists the folloewing information (for which I was not able to find the source.)

### Here is a breakdown of the common fields you would typically find:

* Interface: The name of the wireless network interface (e.g., wlan0, phy0).
* Status: The current status of the interface, often a 4-digit hexadecimal value representing various flags.
* Quality - link: A general indicator of the reception quality.
* Quality - level: The signal strength at the receiver, often in dBm.
* Quality - noise: The noise level (signal without packets) at the receiver, also often in dBm.
* Discarded - nwid: The number of packets discarded due to an invalid network ID (SSID).
* Discarded - crypt: The number of packets that could not be decrypted.
* Discarded - frag: The number of discarded packets that failed MAC reassembly.
* Discarded - retry: The number of discarded packets due to exceeding the maximum MAC retries.
* Discarded - misc: The number of packets discarded for other miscellaneous reasons.
* Missed - beacon: The number of missed beacons or superframes.
* WE: The version of Wireless Extensions supported by the driver.