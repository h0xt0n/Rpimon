#!/bin/sh
t="tmux"
s="split-window"
$t new-session -d -s mon
$t rename-window 'Monitoring'
$t send-keys "watch -n 2 vcgencmd measure_temp" C-m
$t $s -v -p 75 'watch -n 2 "free"'
$t $s -h -t 0 'watch -n 2 "cat /proc/loadavg"'
$t $s -v -t 1 'watch -n 2 "df -h"'
$t select-pane -t 0
$t -2 attach-session -t mon

