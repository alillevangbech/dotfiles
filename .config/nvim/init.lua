-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
-- paq install
-- git clone --depth=1 https://github.com/savq/paq-nvim.git $HOME/.local/share/nvim/site/pack/paqs/start/paq-nvim 
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'neovim/nvim-lspconfig'}
paq {'hrsh7th/nvim-compe'}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'vim-airline/vim-airline'}
paq {'vim-airline/vim-airline-themes'}
paq {'morhetz/gruvbox'}
paq {'savq/paq-nvim', opt = true}
paq {'junegunn/fzf'}
paq {'junegunn/fzf.vim'}  -- to enable preview (optional)
paq {'ojroques/nvim-lspfuzzy'}
   

-------------------- OPTIONS -------------------------------
cmd 'colorscheme gruvbox'
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.wildmode = {'list', 'longest'}
opt.pumheight = 15 
opt.number = true
opt.hlsearch = false
opt.hidden = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.termguicolors = true            -- True color support

-------------------- MAPPINGS ------------------------------
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-------------------- PLUGIN SETUP ---------------------------
require('compe').setup {
  min_length = 2,
  preselect = 'disable',
  source = {buffer = true, path = true, nvim_lsp = true, omni = {filetypes = {'tex'}}},
}

require('lspfuzzy').setup {}

-------------------- LSP -----------------------------------
for ls, cfg in pairs({
	pylsp = {}, clangd = {},
}) do require('lspconfig')[ls].setup(cfg) end
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gq', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
