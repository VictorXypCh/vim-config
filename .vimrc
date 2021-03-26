set encoding=UTF-8
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
call plug#end()

"Config Section

set number
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
	"Windows CMD as terminal
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
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
	


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
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" Clipboard 
" Fedora need to install vimx and set alias vim=vimx
"
"" Uncomment to share same clipboard
"set clipboard=unnamedplus
set mouse=a

vnoremap <C-c> "+y
vnoremap <C-d> "+d
