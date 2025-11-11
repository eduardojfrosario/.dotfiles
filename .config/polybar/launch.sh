#!/usr/bin/env bash
# Kill running bars
pkill -x polybar 2>/dev/null

# Wait for them to close
while pgrep -x polybar >/dev/null; do sleep 0.2; done

# Launch on every connected monitor
polybar main &

