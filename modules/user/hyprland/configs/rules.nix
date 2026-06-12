{
  "exec-once" = [
    "wallpaper-shuffle"
    "mako"
  ];

  windowrule = {
    name = "pip";
    "match:title" = "Picture in picture";
    float = "on";
    pin = "on";
    size = "480 270";
    move = "(monitor_w - window_w - 4) (monitor_h - window_h - 4)";
  };
}
