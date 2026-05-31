{ pkgs, ... }:

{ 
  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
	  enable = true;
	  config.common.default = "*";
	};

  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [ libxdamage ];

  system.stateVersion = "24.05";

  nix = { 
    settings = {
      experimental-features = [ 
        "nix-command" 
        "flakes" 
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Unity Editor runtime dependencies
      libGL            # OpenGL — 3D rendering in the editor viewport
      openal           # Audio playback and spatial sound
      curl             # HTTP — licence checks, asset store, package manager
      gtk3             # Native file dialogs (open/save project)
      icu              # Unicode and locale support for text rendering
      zlib             # Compression — asset bundles, package downloads
      libgcc           # GCC runtime — C++ standard library internals
      glib             # GObject/GIO base — used by GTK and D-Bus bindings
      nss              # TLS/SSL certificate validation (HTTPS)
      nspr             # Portable runtime layer required by NSS
      atk              # Accessibility toolkit required by GTK
      cups             # Print subsystem headers expected by Chrome Embedded Framework
      libdrm           # Direct Rendering Manager — GPU memory management
      expat            # XML parsing — project and config files
      libxcb           # Low-level X11 connection used by the editor window
      libxkbcommon     # Keyboard layout handling
      libxcomposite # Window compositing (transparency, overlays)
      libxdamage    # Tracks screen regions that need repainting
      libxext       # Common X11 extensions
      libxfixes     # Cursor and region fix extensions
      libxrandr     # Monitor resolution and multi-display support
      libxshmfence  # Shared memory fences for GPU synchronisation
      mesa             # Open-source OpenGL/Vulkan implementation
    ];
  };

  boot.loader.grub.configurationLimit = 5;
}
