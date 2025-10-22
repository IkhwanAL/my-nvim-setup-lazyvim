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
      "templ",
      "html",
      "css",
      "sql",
      "zig",
      "htmx",
    })

    opts.highlight = opts.highlight or {}
    opts.highlight.enable = true

    -- Let templ reuse HTML highlighting rules
    vim.treesitter.language.register("html", "templ")

    return opts
  end,
}
