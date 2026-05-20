{ inputs, ... }: 

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };
}