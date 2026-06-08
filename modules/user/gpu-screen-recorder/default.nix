{ pkgs, constants, ... }:

let
  clipsDir = constants.dirs.clips;

  clipSave = pkgs.writeShellApplication {
    name = "clip-save";
    runtimeInputs = with pkgs; [
      ffmpeg
      libnotify
      bc
      procps
    ];
    text = builtins.readFile ./clip-save.sh;
  };
in
{
  home.packages = [
    clipSave
    pkgs.gpu-screen-recorder
  ];

  home.sessionVariables.XDG_CLIPS_DIR = clipsDir;

  systemd.user.services.gpu-screen-recorder = {
    Unit = {
      Description = "GPU Screen Recorder replay buffer";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      # TODO: figure out how to multi-track mic
      ExecStart = "${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder -w HDMI-A-1 -f 60 -a default_output|default_input -c mp4 -r 600 -o ${clipsDir}";
      Restart = "on-failure";
      RestartSec = "5";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
