# pi theme bridged from the active stylix base16 palette.
# `colors` is `config.lib.stylix.colors.withHashtag` (hex with leading '#').
# Mapping follows base16 conventions, consistent with the nvchad
# gruvbox_amoled theme (e.g. operators -> base0D).
{ colors }:

{
  "$schema" = "https://raw.githubusercontent.com/earendil-works/pi/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json";
  name = "gruvbox_amoled";
  vars = {
    inherit (colors)
      base00
      base01
      base02
      base03
      base04
      base05
      base06
      base07
      base08
      base09
      base0A
      base0B
      base0C
      base0D
      base0E
      base0F
      ;
  };
  colors = {
    # Core UI
    accent = "base0D";
    border = "base02";
    borderAccent = "base0D";
    borderMuted = "base01";
    success = "base0B";
    error = "base08";
    warning = "base0A";
    muted = "base04";
    dim = "base03";
    text = "base05";
    thinkingText = "base04";

    # Backgrounds / messages
    selectedBg = "base02";
    userMessageBg = "base01";
    userMessageText = "base05";
    customMessageBg = "base01";
    customMessageText = "base05";
    customMessageLabel = "base0D";
    toolPendingBg = "base01";
    toolSuccessBg = "base01";
    toolErrorBg = "base01";
    toolTitle = "base0D";
    toolOutput = "base05";

    # Markdown
    mdHeading = "base0D";
    mdLink = "base0D";
    mdLinkUrl = "base09";
    mdCode = "base0B";
    mdCodeBlock = "base05";
    mdCodeBlockBorder = "base02";
    mdQuote = "base0C";
    mdQuoteBorder = "base03";
    mdHr = "base03";
    mdListBullet = "base08";

    # Diffs
    toolDiffAdded = "base0B";
    toolDiffRemoved = "base08";
    toolDiffContext = "base04";

    # Syntax
    syntaxComment = "base03";
    syntaxKeyword = "base0E";
    syntaxFunction = "base0D";
    syntaxVariable = "base08";
    syntaxString = "base0B";
    syntaxNumber = "base09";
    syntaxType = "base0A";
    syntaxOperator = "base0D";
    syntaxPunctuation = "base05";

    # Thinking levels
    thinkingOff = "base04";
    thinkingMinimal = "base0C";
    thinkingLow = "base0D";
    thinkingMedium = "base0B";
    thinkingHigh = "base0A";
    thinkingXhigh = "base08";

    # Bash mode
    bashMode = "base09";
  };
}
