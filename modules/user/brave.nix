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
