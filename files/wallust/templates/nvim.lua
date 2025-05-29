-- Please edit in ~/.config/wallust/templates/nvim

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
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
local plugins = {
  -- Chuck packages in here
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },



  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  


  {"OXY2DEV/markview.nvim", lazy = false},
  


  {
    "goolord/alpha-nvim",
    config = function()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },
  


  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "super-tab" },
      appearance = {nerd_font_variant = "mono"},
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  


  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh install.sh",
    config = function()
      require("sniprun").setup({
        display = {"Terminal"}
      })
    end,
  },
  


  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  


  {
    "rasulomaroff/reactive.nvim",
    config = function()
      require("reactive").setup ({
        builtin = {
          cursorline = true,
          cursor = true,
          modemsg = true
        }
      })
      end,
      }
}



require("lazy").setup(plugins, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.api.nvim_set_keymap('n', '<leader>sr', '<Plug>SnipRun', {silent = false})
vim.api.nvim_set_keymap('n', '<leader>sc', '<Plug>SnipClose', {silent = true})

vim.cmd[[colorscheme tokyonight-moon]]
