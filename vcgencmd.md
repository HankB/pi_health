# vcgencmd

The Raspberry Pi specific command to fetch and set some variables. `man ...` suggests the following options:

```text
hbarta@brandywine:~ $ vcgencmd commands
commands="commands, set_logging, bootloader_config, bootloader_version, cache_flush, codec_enabled, get_mem, get_rsts, measure_clock, measure_temp, measure_volts, get_hvs_asserts, get_config, get_throttled, pmicrd, pmicwr, read_ring_osc, version, readmr, otp_dump, set_vll_dir, set_backlight, get_lcd_info, arbiter, test_result, get_camera, enable_clock, scaling_kernel, scaling_sharpness, hdmi_ntsc_freqs, hdmi_adjust_clock, hdmi_status_show, hvs_update_fields, pwm_speedup, force_audio, hdmi_stream_channels, hdmi_channel_map, display_power, memtest, dispmanx_list, schmoo, render_bar, disk_notify, inuse_notify, sus_suspend, sus_status, sus_is_enabled, sus_stop_test_thread, egl_platform_switch, mem_validate, mem_oom, mem_reloc_stats, hdmi_cvt, hdmi_timings, file, vcos, ap_output_control, ap_output_post_processing, vchi_test_init, vchi_test_exit, pm_set_policy, pm_get_status, pm_show_stats, pm_start_logging, pm_stop_logging, vctest_memmap, vctest_start, vctest_stop, vctest_set, vctest_get"
hbarta@brandywine:~ $ 
```

And the list formatted for easier viewing

```text
commands
set_logging
bootloader_config
bootloader_version
cache_flush
codec_enabled
get_mem
get_rsts
measure_clock
measure_temp
measure_volts
get_hvs_asserts
get_config
get_throttled
pmicrd
pmicwr
read_ring_osc
version
readmr
otp_dump
set_vll_dir
set_backlight
get_lcd_info
arbiter
test_result
get_camera
enable_clock
scaling_kernel
scaling_sharpness
hdmi_ntsc_freqs
hdmi_adjust_clock
hdmi_status_show
hvs_update_fields
pwm_speedup
force_audio
hdmi_stream_channels
hdmi_channel_map
display_power
memtest
dispmanx_list
schmoo
render_bar
disk_notify
inuse_notify
sus_suspend
sus_status
sus_is_enabled
sus_stop_test_thread
egl_platform_switch
mem_validate
mem_oom
mem_reloc_stats
hdmi_cvt
hdmi_timings
file
vcos
ap_output_control
ap_output_post_processing
vchi_test_init
vchi_test_exit
pm_set_policy
pm_get_status
pm_show_stats
pm_start_logging
pm_stop_logging
vctest_memmap
vctest_start
vctest_stop
vctest_set
vctest_get
```