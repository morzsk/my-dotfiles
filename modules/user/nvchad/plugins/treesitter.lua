return {
  name = "nvim-treesitter",
  dir = "$TREESITTER_DIR",
  build = false,
  opts = {
    ensure_installed = {},
    parser_install_dir = "$TREESITTER_PARSER_DIR",
  },
}
