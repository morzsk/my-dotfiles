return {
  name = "yazi.nvim",
  dir = "$YAZI_NVIM_DIR",
  build = false,
  event = "VeryLazy",
  keys = {
    { "<leader>y", "<cmd>Yazi<cr>", desc = "Open yazi" },
  },
  opts = {
    open_for_dir = false,
  },
}
