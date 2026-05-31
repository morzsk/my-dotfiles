{ ... }:

{
  environment.etc."brave/policies/managed/settings.json".text = builtins.toJSON {
    BraveWalletDisabled = true;
    BraveRewardDisabled = true;
    BraveVPNDisabled = true;
    BraveNewsDisabled = true;
    BraveTalkDisabled = true;
  };

  environment.etc."brave/policies/managed/extensions.json".text = builtins.toJSON {
    ExtensionInstallForcelist = [
      "ghmbeldphafepmbegfdlkpapadhbakde;https://clients2.google.com/service/update2/crx"
      "jplgfhpmjnbigmhklmmbgecoobifkmpa;https://clients2.google.com/service/update2/crx"
      "dbepggeogbaibhgnhhndojpepiihcmeb;https://clients2.google.com/service/update2/crx"
      "hkgfoiooedgoejojocmhlaklaeopbecg;https://clients2.google.com/service/update2/crx"
      "eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx"
    ];
  };
}
