DURATION=${1:-60}
CLIPS_DIR="${XDG_CLIPS_DIR:-$HOME/Videos/Clips}"

GSR_PID=$(pgrep -f gpu-screen-recorder 2>/dev/null | head -1)
if [[ -z "$GSR_PID" ]]; then
  notify-send -u critical -a "Clip" "Recorder not running"
  exit 1
fi
kill -SIGUSR1 "$GSR_PID"

sleep 1.5

LATEST=$(find "$CLIPS_DIR" -maxdepth 1 -name "*.mp4" -printf "%T@ %p\n" 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)
if [[ -z "$LATEST" ]]; then
  notify-send -u critical -a "Clip" "No clip file found"
  exit 1
fi

if [[ "$DURATION" -lt 600 ]]; then
  FULL_DUR=$(ffprobe -v quiet -show_entries format=duration \
    -of default=noprint_wrappers=1:nokey=1 "$LATEST")
  START=$(echo "$FULL_DUR - $DURATION" | bc)
  if (($(echo "$START < 0" | bc -l))); then START=0; fi
  TRIMMED="${LATEST%.mp4}_${DURATION}s.mp4"
  ffmpeg -ss "$START" -i "$LATEST" -c copy "$TRIMMED" -y -loglevel quiet
  rm "$LATEST"
  notify-send -a "Clip" "Saved last ${DURATION}s" "$(basename "$TRIMMED")"
else
  notify-send -a "Clip" "Saved last 10m" "$(basename "$LATEST")"
fi
