return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}

    -- manual completion trigger (blink equivalent of VSCode ctrl+space)
    opts.keymap["<C-e>"] = { "show" }

    -- OPTIONAL: If you also want <CR> to confirm like cmp.confirm({ select = true })
    -- opts.keymap["<CR>"] = { "accept", "fallback" }
  end,
}
