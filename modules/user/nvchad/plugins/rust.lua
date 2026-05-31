return {
  name = "rustaceanvim",
  dir = "$RUSTACEANVIM_DIR",
  ft = "rust",
  init = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = { "rust-analyzer" },
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
            inlayHints = {
              bindingModeHints = { enable = true },
              closureCaptureHints = { enable = true },
              lifetimeElisionHints = { enable = "skip_trivial" },
            },
          },
        },
      },
    }
  end,
}
