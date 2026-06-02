return {
  name = "nvim-treesitter",
  dir = "$TREESITTER_DIR",
  build = false,
  init = function()
    vim.opt.rtp:prepend("$TREESITTER_DIR/runtime")
  end,
  opts = {
    ensure_installed = {},
    parser_install_dir = "$TREESITTER_PARSER_DIR",
  },
}
