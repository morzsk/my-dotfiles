{ ... }: 

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    settings = {
      editor = {
        cmd = "nvim";
      };
    };
  };
}
