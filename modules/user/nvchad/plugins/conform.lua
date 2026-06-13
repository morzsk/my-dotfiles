return {
  name = "conform.nvim",
  dir = "$CONFORM_DIR",
  build = false,
  event = "BufWritePre",
  keys = {
    {
      "<leader>cf",
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      desc = "Format file",
    },
  },
  opts = {
    formatters_by_ft = {
      lua              = { "stylua" },
      nix              = { "nixfmt" },
      javascript       = { "prettier" },
      typescript       = { "prettier" },
      javascriptreact  = { "prettier" },
      typescriptreact  = { "prettier" },
      json             = { "prettier" },
      css              = { "prettier" },
      html             = { "prettier" },
      c                = { "clang_format" },
      cpp              = { "clang_format" },
      rust             = { "rustfmt" },
      sh               = { "shfmt" },
      bash             = { "shfmt" },
      zig              = { "zigfmt" },
      python           = { "ruff_format" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
