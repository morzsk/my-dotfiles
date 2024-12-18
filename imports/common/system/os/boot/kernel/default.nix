{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_latest_libre.v4l2loopback
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ 
    v4l2loopback
  ];

  boot.kernelModules = [ 
    "v4l2loopback" 
  ];

  programs.adb.enable = true; # enable android proper data tethering
}
