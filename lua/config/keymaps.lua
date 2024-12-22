-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

for _, mode in ipairs({ "i", "v", "n", "x" }) do
  -- duplicate line
  map(mode, "<S-Down>", "<cmd>t.<cr>", opts)
  map(mode, "<S-Up>", "<cmd>t -1<cr>", opts)
  -- save file
  map(mode, "<C-s>", "<cmd>silent! w<cr>", opts)
end

map("x", "<S-Down>", ":'<,'>t'><cr>", opts)
map("x", "<S-Up>", ":'<,'>t-1<cr>", opts)
