vim.lsp.enable({ "nil_ls", "ts_ls", "omnisharp", "zls", "clangd", "bashls" })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚",
      [vim.diagnostic.severity.WARN]  = "󰀪",
      [vim.diagnostic.severity.INFO]  = "󰋽",
      [vim.diagnostic.severity.HINT]  = "󰌵",
    },
  },
})
