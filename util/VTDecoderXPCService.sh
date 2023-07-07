#!/bin/bash
# https://www.reddit.com/r/hackintosh/comments/oqvz8f/comment/iw8h9zo/?utm_source=share&utm_medium=web2x&context=3
while true
do
	pids=""
	pids=$(pgrep VTDecoderXPCService)
	echo "$pids" | while read -r pid
	do
		echo "PID: $pid"
		if [ -n "$pid" ]
		then
			echo "Killing VTDecoder $PID"
			kill -9 "$pid"
		else
			echo "VTDecoder Not Running"
		fi
	done
	echo "Sleeping for 1m"
	sleep 60
done
