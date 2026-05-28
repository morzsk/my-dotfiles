{ ... }: 

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    settings = {
      editor = {
        cmd = "nvim";
      };
      opener = {
        edit  = [{ run = "nvim \"$@\"";   desc = "nvim";    block = true;  }];
        pdf   = [{ run = "evince \"$@\"";  desc = "Evince";  orphan = true; }];
        ebook = [{ run = "readest \"$@\""; desc = "Readest"; orphan = true; }];
      };
      open.rules = [
        { mime = "text/*";               use = "edit";  }
        { mime = "application/pdf";      use = "pdf";   }
        { mime = "application/epub+zip"; use = "ebook"; }
      ];
    };
  };
}
