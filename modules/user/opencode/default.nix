{ config, pkgs, ... }:

{
  programs.opencode = {
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      model = "mistralai/devstral-small-2-2512";
      provider = {
        lmstudio = {
          name = "LM Studio (local)";
          npm = "@ai-sdk/openai-compatible";
          options = {
            baseURL = "http://127.0.0.1:1234/v1";
          };
          models = {
            "mistralai/devstral-small-2-2512" = {
              name = "Mistralai/Devstral Small 2 2512 (local)";
              modalities = {
                input = [ "text" "image" ];
                output = [ "text" ];
              };
              limit = {
                context = 65536;
                output = 4096;
              };
            };
          };
        };
      };
      lsp = {
        typescript = {
          disabled = true;
        };
      };
    };
  };
}