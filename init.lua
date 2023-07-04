require('plugins')

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--NERDTree
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NERDTreeFind<CR>', { noremap = true, silent = true })

-- Fzf Lua
vim.api.nvim_set_keymap('n', '<leader>sf', "<cmd>Files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', "<cmd>Buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sw', "<cmd>Windows<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sG', "<cmd>GFiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sg', "<cmd>GFiles?<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sc', "<cmd>Commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sC', "<cmd>BCommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sq', "<cmd>Commands<CR>", { noremap = true, silent = true })

-- gitsigns
require('gitsigns').setup()



-- Vim Base configs
-- default vim configurations
--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- vim: ts=2 sts=2 sw=2 et
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.textwidth=80
vim.opt.wrap=false
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.fileformat="unix"

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set hidden so that we can close vim and not lose changes in buffers
-- report = 2 will leave a message when leaving a buffer that has more
--  than two line changes in it.
vim.o.hidden = true
vim.cmd [[set report=2]]

-- no swap files and backup files
vim.o.backup = false
vim.o.swapfile = false
