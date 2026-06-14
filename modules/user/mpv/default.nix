{ ... }:

{
  programs.mpv.enable = true;

  home.sessionVariables.PLAYER = "mpv";

  xdg.configFile."mimeapps.list".force = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "video/mp4"        = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm"       = "mpv.desktop";
      "video/avi"        = "mpv.desktop";
      "video/quicktime"  = "mpv.desktop";
      "video/x-msvideo"  = "mpv.desktop";
      "video/ogg"        = "mpv.desktop";
    };
  };
}
