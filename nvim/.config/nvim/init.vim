if ! filereadable(system('echo -n "$HOME/.config/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $HOME/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $HOME/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "$HOME/.config/nvim/plugged"'))
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim', { 'as' : 'dracula' }
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

""" General
let mapleader =","
set clipboard=unnamedplus
set autoread
set hidden
set path+=**
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""" UI 
syntax on
colorscheme gruvbox
set background=dark
set nohlsearch
set relativenumber
hi Normal guibg=NONE ctermbg=NONE


""" Files & Text
set encoding=utf-8
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set ai
set si
set nowrap


""" Plugins 

" vim airline
"let g:airline_theme='term'

" ycm stuff
"nnoremap gd :YcmCompleter GoToDefinition<CR>
"nnoremap gt :YcmCompleter GoTo<CR>
"nnoremap gi :YcmCompleter GoToImplementation<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_confirm_extra_conf = 0

" nerdtree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

""" Extras
" Latex stuff
autocmd VimLeave *.tex !texclear.sh %
map <leader>p :!oopt.sh <c-r>%<CR>
map <leader>c :w! \| !compiler.sh <c-r>%<CR>
