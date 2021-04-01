set t_Co=256
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors
set term=xterm-256color
set encoding=UTF-8
syntax on
set noerrorbells
set tabstop=4 softtabstop=4

set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase


call plug#begin("~/.vim/plugged")
" Plugin Section

"Theme
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'
"File Explorer and Icon
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"File Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"IntelliSense and Systax Highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
"Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'


"My Custom
Plug 'frazrepo/vim-rainbow'
"Theme
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Surround
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

" Undo tree
Plug 'mbbill/undotree'

" Fugitive (git)
Plug 'tpope/vim-fugitive'
"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

"Config Section
"

nmap <C-s> :w<CR>
set relativenumber
set guifont=Fira\ Code:h12

"Enable Theming Support
if (has("termguicolors"))  
	set termguicolors
endif

" Theme
syntax enable
"set background=dark

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" nerdtree and devicons configs
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''


" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" " Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
	"System terminal
	:term
	resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

" Layout for dev open file explorer and terminal
"augroup NERD
"   au!
"   autocmd VimEnter * call OpenTerminal()
"   autocmd VimEnter * wincmd p
"   autocmd VimEnter * NERDTree
"   autocmd VimEnter * wincmd p
"augroup END
" use alt+hjkl to move between split/vsplit panels
" to get caret press ctrl v (in insert mode) follow by alt h
map h  :wincmd h<CR>
map j  :wincmd j<CR>
map k  :wincmd k<CR>
map l  :wincmd l<CR>

" File Searching
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

" requires silversearcher-ag
" " used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" My Custom

" select autocomplete ctrl j,k
"inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" System Clipboard 
" Fedora need to install vimx and set alias vim=vimx
" After installed 
" use "+y to copy to system clipboard 
" use "+d to cut to system clipboard
"
"" Uncomment to share same clipboard
"set clipboard=unnamedplus

" visual block by mouse
set mouse=a


"vnoremap <C-c> "+y
"vnoremap <C-d> "+d
"
"

" Multi Cursor 
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = 'gb'
"<A-n> : go to insert mode,  Ctrl+v, Alt+n 
let g:multi_cursor_select_all_word_key = 'n'
let g:multi_cursor_start_key           = 'ggb'
"g<A-n>
let g:multi_cursor_select_all_key      = 'gn'
let g:multi_cursor_next_key            = 'gb'
let g:multi_cursor_prev_key            = 'gp'
let g:multi_cursor_skip_key            = 'gx'
let g:multi_cursor_quit_key            = '<Esc>'

" UndoTree

nnoremap <leader>u :UndotreeToggle<CR>




"coc
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)

" fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
" get status
nmap <leader>gs :G<CR>
