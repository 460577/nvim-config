local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
  -- mason
  {
    "williamboman/mason.nvim"
  },
  -- alpha-nvim
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end,
  },
  -- nvim tree
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
  -- mason - lsp
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- zero - lsp
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  -- cmp
  { 'hrsh7th/cmp-nvim-lsp' }, -- source for builtin LSP client
  { 'hrsh7th/nvim-cmp' },     -- completion plugin
  { 'L3MON4D3/LuaSnip' },     -- Lua snippets engine
  { 'hrsh7th/cmp-buffer' },   -- source for buffer words
  { 'hrsh7th/cmp-path' },     -- source for paths
  { 'hrsh7th/cmp-cmdline' },  -- Cmdline completions
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
    config = function()
      local utils = require "lvim.utils"
      local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
      vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
      require("lvim.core.treesitter").setup()
    end,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "User FileOpened",
  },
  -- friendly snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  -- whichkey
  {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
  },
  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- toggle term
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  -- copilot
  {
    "github/copilot.vim",
    lazy = false
  },
  -- auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
}

require("lazy").setup(plugins)
require("mason").setup()
