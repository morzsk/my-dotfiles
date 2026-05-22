{ ... }:

{
	services.flatpak = {
		packages = [
			{ appId = "org.vinegarhq.Vinegar"; origin = "flathub"; }
			{ appId = "org.vinegarhq.Sober"; origin = "flathub"; }
		];
	};
}
