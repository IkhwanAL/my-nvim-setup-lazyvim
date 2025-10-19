-- lua/config/go.lua
-- Minimal Go IDE setup for LazyVim

local lspconfig = require("lspconfig")
local dap = require("dap")
local ts = require("nvim-treesitter.configs")

-- =====================
-- Treesitter
-- =====================
ts.setup({
  ensure_installed = { "go", "gomod" }, -- always install Go parsers
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
})

-- =====================
-- LSP (gopls)
-- =====================
lspconfig.gopls.setup({
  on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- optional keymaps for LSP
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  end,
  settings = {
    gopls = {
      analyses = { unusedparams = true, unreachable = true },
      staticcheck = true,
    },
  },
})

-- =====================
-- Test Runner (vim-test)
-- =====================
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Run all tests in file" })
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "Run full test suite" })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Run last test again" })

-- =====================
-- DAP Debugging (Delve)
-- =====================
dap.adapters.go = function(callback)
  callback({ type = "server", host = "127.0.0.1", port = 38697 })
end

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
}

vim.keymap.set("n", "<leader>d1", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>d2", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>d3", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>d4", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>d5", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
