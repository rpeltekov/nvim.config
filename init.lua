require('plugins')

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- visual mode mappings
vim.api.nvim_set_keymap("v", "<", "<gv^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

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

-- moving remaps
vim.api.nvim_set_keymap('n', '<leader>bh', "<C-W>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bj', "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bk', "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bl', "<C-W>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bH', "<C-W>H", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bJ', "<C-W>J", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bK', "<C-W>K", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bL', "<C-W>L", { noremap = true, silent = true })

-- gitsigns 
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}


-- tree sitter configurations
--vim.opt.runtimepath:append("/some/path/to/store/parsers")
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  -- List of parsers to ignore installing (for "all")
  ignore_install = { "all" },
  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  highlight = {
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}



-- easy-align
-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", {
	remap = true,
})

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", {
	remap = true,
})

----- Vim Base configs

-- autocommands
--- This function is taken from https://github.com/norcalli/nvim_utils had to change api -> vim.api
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

local autocmds = {
    packer = {
        { "BufWritePost", "lua/plugins.lua", "PackerCompile" };
    };
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] };
        { "TermOpen", "*", "startinsert" };
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
    };
    restore_cursor = {
        { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
    };
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" };
    };
}

nvim_create_augroups(autocmds)
-- END autocommands



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
vim.opt.textwidth=120
vim.opt.wrap=false
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.fileformat="unix"

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
--Case insensitive searching UNLESS /C or capital in search vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme slate]]

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

-- good clipboard
-- vim.g.clipboard = {name = "TMUX OSC-52", copy = {["*"] = {"tmux", "load-buffer", "-w", "-"}, ["+"] = {"tmux", "load-buffer", "-w", "-"}}, paste = {["*"] = {"tmux", "save-buffer", "-"}, ["+"] = {"tmux", "save-buffer", "-"}}}
vim.g.clipboard = unnamedplus;

