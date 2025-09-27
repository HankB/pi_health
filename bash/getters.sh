# shellcheck shell=bash
#
# functions to collect various values to moniutor system health.

# Need to remove the trailing '.' in the numbers for valid JSON. 
# Hopefully the fractional part will never be populated.

function get_wifi {
    awk  \
    '/wlan0/{print "\"status\":\""$2 "\", \"link\":"$3", \"level\":"$4", \"noise\":"$5", \"retry\":"$9}'\
    "$1" \
    |sed s/\\.//g
}

# Copied from a Google AI answwer to "bash insert decimal point into string"

function get_cpu_temp {

    cpu_temp_thousandths=$(cat "$1")

    part1="${cpu_temp_thousandths:0:2}"
    part2="${cpu_temp_thousandths:2}"

    result="${part1}.${part2}"
    echo "\"CPU_temp\":$result"
}

function get_meminfo {
    meminfo=$(cat "$1")
    # 
    MemTotal=$(echo "$meminfo"|awk '/MemTotal:/{print "\"MemTotal\":"$2}')
    MemFree=$(echo "$meminfo"|awk '/MemFree:/{print "\"MemFree\":"$2}')
    MemAvailable=$(echo "$meminfo"|awk '/MemAvailable:/{print "\"MemAvailable\":"$2}')
    Buffers=$(echo "$meminfo"|awk '/Buffers:/{print "\"Buffers\":"$2}')
    SwapTotal=$(echo "$meminfo"|awk '/SwapTotal:/{print "\"SwapTotal\":"$2}')
    SwapFree=$(echo "$meminfo"|awk '/SwapFree:/{print "\"SwapFree\":"$2}')
    echo "$MemTotal, $MemFree, $MemAvailable, $Buffers, $SwapTotal, $SwapFree"
}