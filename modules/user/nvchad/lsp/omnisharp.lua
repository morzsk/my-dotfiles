---@type vim.lsp.Config
return {
  cmd = {
    "OmniSharp",
    "-z",
    "--hostPID", tostring(vim.fn.getpid()),
    "DotNet:enablePackageRestore=false",
    "--encoding", "utf-8",
    "--languageserver",
  },
  cmd_env = {
    DOTNET_ROOT = "$DOTNET_SDK_PATH",
  },
  capabilities = {
    general = {
      positionEncodings = { "utf-16" },
    },
  },
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = false,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableImportCompletion = true,
    },
    Sdk = {
      IncludePrereleases = true,
    },
  },
}
