return {
  name = "opencode.nvim",
  dir = "$OPENCODE_NVIM_DIR",
  build = false,
  event = "VeryLazy",
  config = function()
    vim.o.autoread = true -- required for buffer reload when opencode edits files

    vim.g.opencode_opts = {}

    -- opencode takes over <C-a>/<C-x>, so remap vim's increment/decrement
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })

    vim.keymap.set({ "n", "x" }, "<C-a>",  function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<C-x>",  function() require("opencode").select() end,                          { desc = "Select opencode" })
    vim.keymap.set({ "n", "t" }, "<C-.>",  function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })
    vim.keymap.set({ "n", "x" }, "go",     function() return require("opencode").operator("@this ") end,         { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n",          "goo",    function() return require("opencode").operator("@this ") .. "_" end,  { desc = "Add line to opencode", expr = true })
    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })
  end,
}
