{ pkgs, ... }:

{
  home.packages = [ pkgs.libnotify ];

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      anchor = "top-right";
      margin = "16";
      padding = "12";
      border-radius = 0;
      border-size = 0;
    };
  };
}
