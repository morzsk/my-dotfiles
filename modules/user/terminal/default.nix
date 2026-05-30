{ ... }:

{
  programs.bat.enable = true;

  programs.lsd.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
