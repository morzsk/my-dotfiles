{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    package = pkgs.brave;

    extensions = [
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
      { id = "jplgfhpmjnbigmhklmmbgecoobifkmpa"; } # Proton VPN
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
      { id = "hkgfoiooedgoejojocmhlaklaeopbecg"; } # PiP
    ];

    commandLineArgs = [
      "--hompage=https://excalith-start-page.vercel.app/"
    ];
  };
}