-- General preferences
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.g.mapleader= " "

vim.opt.termguicolors = true
vim.cmd("hi Normal ctermbg=none guibg=none")

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
-- Paste from system clipboard in normal mode
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
-- Paste from system clipboard in insert mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
-- Paste from system clipboard in visual mode (replaces selection)
vim.keymap.set('v', '<C-v>', '"+p', { noremap = true, silent = true })
-- Normal mode: Ctrl+Z for undo
vim.keymap.set('n', '<C-z>', 'u', { noremap = true, silent = true })
-- Normal mode: Ctrl+Shift+Z for redo
vim.keymap.set('n', '<C-S-z>', '<C-r>', { noremap = true, silent = true })

-- Lazy features
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup("plugins", opts)

vim.cmd[[colorscheme tokyonight]]

-- Markview
-- Turn off error messages
local presets = require("markview.presets");
require("markview").setup({
        markdown = {
            headings = presets.headings.arrowed,
            horizontal_rules = presets.arrowed,
            tables = presets.rounded
        },
        experimental = {
            check_rtp_message = false
        }
});

-- Telescope (file search)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- I forgot what this does
vim.api.nvim_set_keymap('n', '<leader>sr', '<Plug>SnipRun', {silent = false})
vim.api.nvim_set_keymap('n', '<leader>sc', '<Plug>SnipClose', {silent = true})

--Neotree <3
vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>')

--Inbuilt terminal
vim.keymap.set('n', '<leader>h', '<Cmd>ToggleTerm size=20 dir=~/Desktop direction=horizontal name=desktop<CR>')

vim.wo.number = true

--Change window focus
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
