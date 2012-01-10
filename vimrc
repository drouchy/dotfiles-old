" Use Vim settings instead of Vi.
set nocompatible

" Use tpope/vim-pathogen
call pathogen#infect()

" Remap leader and decrease timeout to 0.5s
let mapleader = ','
set timeoutlen=500

" Line numbers
set number

" DesertEx colorscheme
colorscheme desertEx

" Lots of history
set history=1000

set showcmd	"show incomplete commands at the bottom
set showmode	"show current mode at the bottom

set incsearch	"incremental search
set hlsearch	"highlight search

" no need for swapfiles with git
set noswapfile
set nobackup
set nowb

" indent
set ai	"autoindent
set si	"smart indent
set smarttab

" indent settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" fold settings
set foldmethod=manual
set nofoldenable

" code completion
" complete with xx in Insert mode.
set ofu=syntaxcomplete
imap <leader><tab> <C-p>

" ftplugins and indent files
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" allow hiding of modified buffers
set hidden

" stuff that needs organization
set guifont=Andale\ Mono:h12
set number
set ruler
set linespace=3
set showmatch
set ignorecase
set smartcase
set wildmenu
set wildmode=longest:full
set scrolljump=5
set scrolloff=3
set go-=T			"hide MacVim toolbar
set mousehide
set wrap
set textwidth=79
set formatoptions=qrn1

set background=dark

set splitbelow

" NERDTree
nmap <leader>nt :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" NERDCommenter
let NERDSpaceDelims=1

" SnipMate
let g:snippets_dir = "~/.vim/snippets"

" Mappings
nmap <space> :
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <leader>bv :bel vsp<CR>

imap jj <esc>

" Auto-close HTML tags.
autocmd FileType html
  \ imap <leader>/ </<C-X><C-O><Right>

" automatically re-source vimrc on save vimrc
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif
