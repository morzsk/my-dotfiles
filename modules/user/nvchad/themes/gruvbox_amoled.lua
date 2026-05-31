local M = {}

M.base_30 = {
  white         = "#ebdbb2",
  darker_black  = "#000000",
  black         = "#000000",
  black2        = "#0d0d0d",
  one_bg        = "#171717",
  one_bg2       = "#1f1f1f",
  one_bg3       = "#252525",
  grey          = "#2c2c2c",
  grey_fg       = "#2f2f2f",
  grey_fg2      = "#313131",
  light_grey    = "#454545",
  red           = "#fb4934",
  baby_pink     = "#cc241d",
  pink          = "#ff75a0",
  line          = "#111111",
  green         = "#b8bb26",
  vibrant_green = "#a9b665",
  nord_blue     = "#83a598",
  blue          = "#458588",
  yellow        = "#d79921",
  sun           = "#fabd2f",
  purple        = "#b4bbc8",
  dark_purple   = "#d3869b",
  teal          = "#749689",
  orange        = "#e78a4e",
  cyan          = "#82b3a8",
  statusline_bg = "#0a0a0a",
  lightbg       = "#181818",
  pmenu_bg      = "#83a598",
  folder_bg     = "#749689",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#0d0d0d",
  base02 = "#141414",
  base03 = "#1a1a1a",
  base04 = "#bdae93",
  base05 = "#d5c4a1",
  base06 = "#ebdbb2",
  base07 = "#fbf1c7",
  base08 = "#fb4934",
  base09 = "#fe8019",
  base0A = "#fabd2f",
  base0B = "#b8bb26",
  base0C = "#8ec07c",
  base0D = "#83a598",
  base0E = "#d3869b",
  base0F = "#d65d0e",
}

M.type = "dark"

M = require("base46").override_theme(M, "gruvbox_amoled")

M.polish_hl = {
  defaults = {
    Visual = { bg = "#3c3836" },
  },
  syntax = {
    Operator = { fg = M.base_30.nord_blue },
  },
  treesitter = {
    ["@operator"] = { fg = M.base_30.nord_blue },
  },
}

return M
