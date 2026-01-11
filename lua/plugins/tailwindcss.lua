return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    opts.servers.tailwindcss = {
      filetypes = {
        "html",
        "templ",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "python",
      },
      settings = {
        tailwindCSS = {
          includeLanguages = {
            templ = "html",
          },
          experimental = {
            classRegex = {
              { 'class="([^"]*)"', "[\"'`]([^\"'`]*).*?[\"'`]" },
            },
          },
          validate = true,
        },
      },
    }
  end,
}
