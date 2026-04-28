#!/bin/bash

wlr-randr \
    --output DP-1 --preferred --mode 2560x1440 \
    --pos 1920,0 --transform normal
wlr-randr \
    --output HDMI-A-1 --mode 1920x1080 \
    --pos 0,0 --transform 90 --left-of DP-1

