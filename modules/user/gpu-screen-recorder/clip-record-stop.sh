PID_FILE="/tmp/gsr-manual.pid"

if [[ ! -f "$PID_FILE" ]] || ! kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  notify-send -u critical -a "Clip" "No recording in progress"
  exit 1
fi

kill -SIGINT "$(cat "$PID_FILE")"
rm "$PID_FILE"
notify-send -a "Clip" "Recording saved"
