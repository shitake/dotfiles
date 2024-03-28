-- set runtimepath^=~/.vim runtimepath+=~/.vim/after
-- let &packpath = &runtimepath
-- source ~/.vimrc


-- Config
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })

-- タブ切り替え
vim.keymap.set('n', 'tc', ':tablast <bar> tabnew<CR>', { silent = true })
vim.keymap.set('n', 'tn', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', 'tp', ':tabprevious<CR>', { silent = true })

-- 移動
vim.keymap.set('n', 'th', '<C-w>h', { silent = true })
vim.keymap.set('n', 'tj', '<C-w>j', { silent = true })
vim.keymap.set('n', 'tk', '<C-w>k', { silent = true })
vim.keymap.set('n', 'tl', '<C-w>l', { silent = true })


-- lazy.nvim
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

plugins = require('plugins')
require("lazy").setup(plugins, opts)


-- Colorscheme
require('colorschema/catppuccin')
require('colorschema/nightfox')


-- lualine.nvim
require('lualine').setup()
-- require('lualine/evil_lualine')
-- require('lualine/slanted-gaps')
-- require('lualine/bubbles')


-- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
-- require("nvim-tree").setup({
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })
