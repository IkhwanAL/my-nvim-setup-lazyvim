return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Make sure parsers exist
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      "javascript",
      "lua",
      "vim",
      "go",
      "gomod",
      "html",
      "css",
      "sql",
      "zig",
      "htmx",
      "python",
      "c",
      "cpp",
      "java",
      "css",
    })

    opts.highlight = opts.highlight or {}
    opts.highlight.enable = true

    return opts
  end,
}
