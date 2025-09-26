#
# functions to collect various values to moniutor system health.

# Need to remove the trailing '.' in the numbers for valid JSON. 
# Hopefully the fractional part will never be populated.

function get_wifi {
    awk  \
    '/wlan0/{print "\"status\":\""$2 "\", \"link\":"$3", \"level\":"$4", \"noise\":"$5", \"retry\":"$9}'\
    $1 \
    |sed s/\\.//g
}