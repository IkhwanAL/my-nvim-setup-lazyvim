return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "javascript",
      "lua",
      "vim",
      "go",
      "gomod",
      "templ",
      "html",
      "css",
      "sql",
      "zig",
    },
    highlight = {
      enable = true,
    },
  },
}
