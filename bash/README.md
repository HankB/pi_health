# bash implementation.

## Components

* `getters.sh` - A file of bash functions to be sourced by a test or production driver.
* `test_getters.sh` - Test driver used to facilitate development and testing of the getters.
* `collect_stats.sh` - The actual driver that will source `getters` and output a timestamped JSON package with the results.

It is planned that the output of `collect_stats.sh` will be piped to `mosquitto_pub` to actually publish the results.
