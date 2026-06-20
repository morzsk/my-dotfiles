{
  config,
  pkgs,
  ...
}:

let
  cfg = config.programs.pi-coding-agent;

  # Bridge stylix -> pi: there is no upstream stylix target for pi, so
  # generate a pi theme from the active base16 palette. Tracks whatever
  # base16Scheme is set in stylix.
  piTheme = import ./themes/gruvbox_amoled.nix {
    colors = config.lib.stylix.colors.withHashtag;
  };
in
{
  programs.pi-coding-agent = {
    enable = true;

    # Needed for npm: extensions pi may install at runtime.
    extraPackages = [ pkgs.nodejs ];

    # → ~/.pi/agent/settings.json
    settings = {
      defaultProvider = "anthropic";
      defaultModel = "claude-sonnet-4-20250514";
      defaultThinkingLevel = "medium";
      theme = piTheme.name;

      # Extensions pi installs into ~/.pi/agent/npm on first launch (needs
      # network + nodejs). Listing them here is declarative; pi's resolver
      # auto-installs any configured package whose files are missing.
      #   pi-anthropic-oauth: Claude Pro/Max login via browser OAuth
      #   (`/login anthropic` → Claude Pro/Max), no API key needed.
      packages = [
        "npm:pi-anthropic-oauth"
      ];
      compaction = {
        enabled = true;
        reserveTokens = 16384;
        keepRecentTokens = 20000;
      };
      retry = {
        enabled = true;
        maxRetries = 3;
      };
      enabledModels = [
        "claude-*"
        "gpt-4o"
      ];
    };

    # → ~/.pi/agent/keybindings.json
    # Vim-like scrolling. pi only exposes full-page scroll (no half-page
    # action), so ctrl+u / ctrl+d map to page up / page down.
    keybindings = {
      "tui.editor.pageUp" = [ "pageup" "ctrl+u" ];
      "tui.editor.pageDown" = [ "pagedown" "ctrl+d" ];
      "tui.select.pageUp" = [ "pageup" "ctrl+u" ];
      "tui.select.pageDown" = [ "pagedown" "ctrl+d" ];
    };

    # → ~/.pi/agent/models.json — custom/local providers (e.g. Ollama).
    # Not used for now.
    # models.providers.ollama = {
    #   baseUrl = "http://localhost:11434/v1";
    #   api = "openai-completions";
    #   apiKey = "ollama";
    #   models = [ { id = "llama3.1:8b"; } ];
    # };
  };

  # → ~/.pi/agent/themes/gruvbox_amoled.json
  home.file."${cfg.configDir}/themes/${piTheme.name}.json".text = builtins.toJSON piTheme;
}
