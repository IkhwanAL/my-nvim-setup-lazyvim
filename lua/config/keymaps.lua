-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<C-Del>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

local api = require("Comment.api")

map("n", "<C-\\>", api.toggle.linewise.current, { desc = "Toggle comment line" })
map("x", "<C-\\>", function()
  local mode = vim.fn.visualmode()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
  if mode == "\22" then -- Ctrl-V block mode
    api.toggle.blockwise(mode)
  else
    api.toggle.linewise(mode)
  end
end, { desc = "Toggle comment selection" })
