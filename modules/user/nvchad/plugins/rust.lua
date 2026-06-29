return {
  name = "rustaceanvim",
  dir = "$RUSTACEANVIM_DIR",
  ft = "rust",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function(args)
        vim.keymap.set("n", "<leader>ca", function()
          vim.cmd.RustLsp("codeAction")
        end, { buffer = args.buf, desc = "Rust code actions" })
      end,
    })
  end,
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
