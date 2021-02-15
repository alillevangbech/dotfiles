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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'vshih/vim-make'
"Plug 'dense-analysis/ale'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'OmniSharp/omnisharp-vim'
call plug#end()

""" General
let mapleader =","
set clipboard=unnamedplus
set autoread
set hidden
set path+=**
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR> 

""" UI 
syntax on
colorscheme gruvbox
set background=dark
set nohlsearch
set relativenumber
"set signcolumn=yes
hi Normal guibg=NONE ctermbg=NONE


""" Files & Text
set encoding=utf-8
set expandtab
set smarttab
set tabstop=8
set shiftwidth=8
set ai
set si
set nowrap

" ycm stuff
nnoremap gd :YcmCompleter GoToDefinition<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gt :YcmCompleter GoTo<CR>
nnoremap gi :YcmCompleter GoToImplementation<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" omnisharp / C# devel
"let g:OmniSharp_server_stdio_quickload = 1
"let g:OmniSharp_selector_ui = 'fzf'
"let g:airline#extensions#ale#enabled = 1
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" nerdtree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" fzf
nnoremap <Leader>f :Files
nnoremap <Leader>fs :Files src/<CR>

""" Extras
" Latex stuff
autocmd VimLeave *.tex !texclear.sh %
map <leader>p :!oopt.sh <c-r>%<CR>
map <leader>c :w! \| !compiler.sh <c-r>%<CR>

" make
map ½½ \| :make!


