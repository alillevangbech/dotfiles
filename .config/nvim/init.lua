-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.mapleader = ','

local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------

if fn.filereadable(fn.system('echo -n "$HOME/.config/nvim/autoload/plug.vim"')) == 0 then
	cmd "echo \"Downloading junegunn/vim-plug to manage plugins...\""
	cmd "silent !mkdir -p $HOME/.config/nvim/autoload/"
	cmd "silent !curl \"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\" > $HOME/.config/nvim/autoload/plug.vim"
end
local Plug = fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug('junegunn/fzf', {['do'] = fn['fzf#install']})
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
Plug 'ray-x/lsp_signature.nvim'
Plug 'ojroques/nvim-lspfuzzy'
vim.call('plug#end')

-------------------- OPTIONS -------------------------------
cmd 'colorscheme gruvbox'
opt.completeopt = {'menuone', 'noselect'}
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
-- Make
map('n', '<leader>b',"<cmd>w | !make<CR>")
map('s', '<tab>',"c")
map('n', '<tab>',"f*xi")

-- keyboard slow

cmd 'command! Q quit'
cmd 'command! W write'
cmd 'command! Wq wq'

-------------------- PLUGIN SETUP ---------------------------
require 'lspfuzzy'.setup {}

local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
	completion = {
		completeopt = 'menu,menuone,noinsert',
		keyword_length = 2,
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<Tab>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
	},
}

-------------------- LSP -----------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	},
}

for ls, cfg in pairs({
	pylsp = {},
	clangd = { 
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = {
			["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				virtual_text = false
			}),
		},
	},
}) do require('lspconfig')[ls].setup(cfg) end

require'lsp_signature'.setup {
	bind = true,
	doc_lines = 5,
	floating_window = true,
	hint_enable = false,
	handler_opts = {border = "single"},
	extra_trigger_chars = {"(", ","},
}

-- Movement
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'ge', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

-- Info
map('n', '<C-q>', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<C-f>', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<C-h>', '<cmd>lua vim.lsp.buf.hover()<CR>')



