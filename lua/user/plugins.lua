local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins

  -- Impatient
  use 'lewis6991/impatient.nvim'

  -- Colorschemes
  -- use 'lunarvim/colorschemes' -- A bunch of colorschemes you can try out
  -- use 'lunarvim/darkplus.nvim'
  use 'Shatur/neovim-ayu'
  use 'EdenEast/nightfox.nvim'

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'natecraddock/telescope-zf-native.nvim'
  use 'nvim-telescope/telescope-live-grep-args.nvim'

  -- COC
  -- use { 'neoclide/coc.nvim', branch = 'release' }

  -- LSP and autocomplete
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
  }

  -- Null-ls
  use 'jose-elias-alvarez/null-ls.nvim'

  -- DAP
  use 'mfussenegger/nvim-dap'

  -- LaTeX
  use 'lervag/vimtex'

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- Indent-o-matic
  use 'Darazaki/indent-o-matic'

  -- Comment
  use 'terrortylor/nvim-comment'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = 'nvim-treesitter/nvim-treesitter' }

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- NvimTree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Project
  use 'ahmedkhalf/project.nvim'

  -- Buffer Line
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'

  -- Surround
  use { 'kylechui/nvim-surround', config = function() require('nvim-surround').setup() end }

  -- Terminal
  use 'akinsho/toggleterm.nvim'

  -- Indentline
  use 'lukas-reineke/indent-blankline.nvim'

  -- Alpha
  use 'goolord/alpha-nvim'

  -- Whichkey
  use 'folke/which-key.nvim'

  -- Todo comments
  use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
