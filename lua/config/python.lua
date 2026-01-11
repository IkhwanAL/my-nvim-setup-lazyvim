local lspconfig = require("lspconfig")

vim.lsp.config["pyright"] = {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
      },
    },
  },
}

vim.lsp.config["ruff"] = {
  init_options = {
    settings = {
      logLevel = "debug",
    },
  },
}
