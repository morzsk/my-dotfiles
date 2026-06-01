{ pkgs, ... }:

{
  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # graphics
  hardware.graphics.enable = true;

  # locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
    "zh_TW.UTF-8/UTF-8"
    "ko_KR.UTF-8/UTF-8"
    "ar_SA.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];

  fonts.packages = with pkgs; [
    noto-fonts
  ];
}
