local cmp = require("cmp")

cmp.setup({
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged }, -- popup as you type
    completeopt = "menu,menuone,noselect",
  },

  mapping = {
    ["<C-e>"] = cmp.mapping.complete(), -- manual trigger like VSCode
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm completion
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  }),
})
