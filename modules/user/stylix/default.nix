{ constants, ... }:

{
  imports = [ (constants.paths.modules.shared + /stylix) ];

  stylix.targets.gtk.extraCss = "window.background { border-radius: 0; }";
  stylix.targets.neovim.enable = false;
}
