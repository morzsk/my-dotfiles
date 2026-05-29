{ pkgs, ... }:

{
  systemd.user.services.brave-preload = {
    Unit = {
      Description = "Preload Brave browser into page cache";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.brave}/bin/brave --headless --no-sandbox --disable-gpu --virtual-time-budget=1000";
      RemainAfterExit = false;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  programs.chromium = {
    enable = true;

    package = pkgs.brave;

    extensions = [
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
      { id = "jplgfhpmjnbigmhklmmbgecoobifkmpa"; } # Proton VPN
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
      { id = "hkgfoiooedgoejojocmhlaklaeopbecg"; } # PiP
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
    ];

    commandLineArgs = [
      "--disable-background-networking"
      "--disable-features=InterestFeedV2"
      "--ozone-platform-hint=auto"
      #"--hompage=https://excalith-start-page.vercel.app/ --password-store=basic"
    ];
  };
}
