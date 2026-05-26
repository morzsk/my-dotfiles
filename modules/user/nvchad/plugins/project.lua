return {
  name = "project.nvim",
  dir = "$PROJECT_NVIM_DIR",
  build = false,
  event = "VeryLazy",
  keys = {
    { "<leader>fg", "<cmd>Telescope projects<cr>", desc = "Find projects" },
  },
  config = function()
    require("project").setup({})
    require("telescope").load_extension("projects")
  end,
}
