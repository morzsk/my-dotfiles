{ ... }:

{
  programs.bat.enable = true;

  programs.lsd.enable = true;

  programs.ripgrep.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
