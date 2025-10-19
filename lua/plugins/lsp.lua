return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      zls = {},
      vtsls = {},
      templ = {},
      sqls = {},
      tailwindcss = {
        filetypes = {
          "html",
          "templ",
          "css",
          "scss",
          "javascript",
        },
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      },
    },
  },
}
