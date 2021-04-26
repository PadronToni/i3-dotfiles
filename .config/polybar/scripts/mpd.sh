#!/bin/bash

( pidof mpd && killall mpd || mpd ) 1>/dev/null

