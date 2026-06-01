return {
  name = "nvim-jdtls",
  dir = "$JDTLS_NVIM_DIR",
  ft = "java",
  config = function()
    local jdtls = require("jdtls")
    local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts", ".git" }
    local bundles = vim.fn.glob("$JAVA_DEBUG_SERVER_DIR/com.microsoft.java.debug.plugin-*.jar", false, true)

    local function start_jdtls()
      local root_dir = require("jdtls.setup").find_root(root_markers) or vim.fn.getcwd()
      local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
      jdtls.start_or_attach({
        cmd = { "jdtls", "-data", workspace_dir },
        root_dir = root_dir,
        init_options = { bundles = bundles },
        on_attach = function()
          jdtls.setup_dap({ hotcodereplace = "auto" })
        end,
      })
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = start_jdtls,
    })

    start_jdtls()
  end,
}
