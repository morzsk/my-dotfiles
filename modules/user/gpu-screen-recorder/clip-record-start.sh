CLIPS_DIR="${XDG_CLIPS_DIR:-$HOME/Videos/Clips}"
PID_FILE="/tmp/gsr-manual.pid"

if [[ -f "$PID_FILE" ]] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  notify-send -u critical -a "Clip" "Recording already in progress"
  exit 1
fi

OUTPUT="${CLIPS_DIR}/$(date +%Y-%m-%d_%H-%M-%S)_manual.mp4"
gpu-screen-recorder -w screen -f 60 -a "default_output|default_input" -c mp4 -o "$OUTPUT" &
echo $! > "$PID_FILE"
notify-send -a "Clip" "Recording started"
