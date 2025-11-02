{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.glibcLocales
  ];

  time.timeZone = "Europe/Dublin";

  i18n = {
    defaultLocale = "en_GB.UTF-8";

    supportedLocales = [ "en_GB.UTF-8/UTF-8" "en_IE.UTF-8/UTF-8" ];

    extraLocaleSettings = {
      LC_ADDRESS = "en_IE.UTF-8";
      LC_IDENTIFICATION = "en_IE.UTF-8";
      LC_MEASUREMENT = "en_IE.UTF-8";
      LC_MONETARY = "en_IE.UTF-8";
      LC_NAME = "en_IE.UTF-8";
      LC_NUMERIC = "en_IE.UTF-8";
      LC_PAPER = "en_IE.UTF-8";
      LC_TELEPHONE = "en_IE.UTF-8";
      LC_TIME = "en_IE.UTF-8";
    };
  };
}
