-- this file is loaded by calling `lua require('plugins') from init.lua
-- Not enabling this yet
--
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])
-- 
-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end
-- 
-- local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  -- so that packer can manage itself
  use 'wbthomason/packer.nvim'
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end

  -- fzf lua
  use {'~/.config/nvim/plugin_sources/fzf-master', alias = 'fzf'}
  use {'~/.config/nvim/plugin_sources/fzf.vim-master', alias = 'fzf.vim'}
  
  -- nerdtree
  use {'~/.config/nvim/plugin_sources/nerdtree-master', alias = 'nerdtree'}
  
  -- gitsigns
  use {'~/.config/nvim/plugin_sources/gitsigns.nvim-main', alias = 'gitsigns'}
end)
