#!/bin/bash
SINK=1
vol=`pactl list sinks | grep '^[[:space:]]Volume:' | \
        head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*%\).*,\1,'`

mutemsg=`pactl list sinks | grep '^[[:space:]]Mute:'|head -n $(( $SINK+1 ))|tail -n 1`
muteflag=`if [[ "$mutemsg" == *"yes"* ]]; then echo \(Muted\); fi`
echo -e Volume: $vol $muteflag

