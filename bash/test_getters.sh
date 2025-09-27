#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
############### end of Boilerplate

# Code to test the getters.

# expect 'getters.sh' in the same directory and test data in .../test_data

source_dir=$(dirname "$0")
source "$source_dir/getters.sh"

wifi_stuff=$(get_wifi test_data/proc_net_wireless.txt)

echo "{ $wifi_stuff }"

cpu_temp=$(get_cpu_temp test_data/sys_class_thermal_thermal_zone0_temp.txt)

echo "{ $cpu_temp }"

meminfo_stuff=$(get_meminfo test_data/proc_meminfo.txt)

echo "{ $meminfo_stuff }"
