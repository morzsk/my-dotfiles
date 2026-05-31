{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    package = pkgs.brave;

    commandLineArgs = [
      "--disable-features=InterestFeedV2"
      "--ozone-platform-hint=auto"
      "--force-dark-mode"
      "--enable-features=WebUIDarkMode"
      #"--hompage=https://excalith-start-page.vercel.app/ --password-store=basic"
    ];
  };
}
