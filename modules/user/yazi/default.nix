{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    # https://github.com/yazi-rs/plugins
    # https://github.com/AnirudhG07/awesome-yazi
    plugins = {
      preview-epub =
        pkgs.fetchFromGitHub {
          owner = "AminurAlam";
          repo = "yazi-plugins";
          rev = "6206bae4c7887915db1cdf3b353a044578763195";
          hash = "sha256-xTYYLbrqb1cZeQzaWPzldBfpx3r5s2XyeRTYBA8jbq4=";
        }
        + "/preview-epub.yazi";
    };

    settings = {
      editor = {
        cmd = "nvim";
      };
      opener = {
        edit = [
          {
            run = "nvim \"$@\"";
            desc = "nvim";
            block = true;
          }
        ];
        pdf = [
          {
            run = "evince \"$@\"";
            desc = "Evince";
            orphan = true;
          }
        ];
        ebook = [
          {
            run = "readest \"$@\"";
            desc = "Readest";
            orphan = true;
          }
        ];
      };
      open.rules = [
        {
          mime = "text/*";
          use = "edit";
        }
        {
          mime = "application/pdf";
          use = "pdf";
        }
        {
          mime = "application/epub+zip";
          use = "ebook";
        }
      ];
      plugin = {
        prepend_previewers = [
          {
            mime = "application/epub+zip";
            run = "preview-epub";
          }
        ];
        prepend_preloaders = [
          {
            mime = "application/epub+zip";
            run = "preview-epub";
          }
        ];
      };
    };
  };
}
