return {
  name = "opencode.nvim",
  dir = "$OPENCODE_NVIM_DIR",
  build = false,
  event = "VeryLazy",
  config = function()
    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end,                          { desc = "Select opencode prompt" })
    vim.keymap.set({ "n", "t" }, "<leader>ot", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })
  end,
}
