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

  clipRecordStart = pkgs.writeShellApplication {
    name = "clip-record-start";
    runtimeInputs = with pkgs; [
      gpu-screen-recorder
      libnotify
    ];
    text = builtins.readFile ./clip-record-start.sh;
  };

  clipRecordStop = pkgs.writeShellApplication {
    name = "clip-record-stop";
    runtimeInputs = with pkgs; [
      libnotify
    ];
    text = builtins.readFile ./clip-record-stop.sh;
  };
in
{
  home.packages = [
    clipSave
    clipRecordStart
    clipRecordStop
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
      ExecStart = "${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder -w screen -f 60 -a default_output|default_input -c mp4 -r 600 -o ${clipsDir}";
      Restart = "on-failure";
      RestartSec = "5";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
