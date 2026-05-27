{ pkgs, ... }:

{
  programs.obs-studio = {
    enable  = true;
    plugins = with pkgs.obs-studio-plugins; [
      # Audio capture from PipeWire sources (apps, sinks, etc.)
      obs-pipewire-audio-capture
    ];
  };
}
