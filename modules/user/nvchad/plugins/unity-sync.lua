return {
  name = "nvim-unity-sync",
  dir = "$UNITY_SYNC_DIR",
  build = false,
  ft = { "cs" },
  config = function()
    require("unity.plugin").setup({})
  end,
}
