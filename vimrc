" Use Vim settings instead of Vi.
set nocompatible

" Use tpope/vim-pathogen
call pathogen#infect()
call pathogen#helptags()

" Remap leader and decrease timeout to 0.5s
"let mapleader = ','
set timeoutlen=500

" Line numbers
set number

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

autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent
autocmd FileType scss setlocal foldmethod=indent

" code completion
" complete with xx in Insert mode.
set ofu=syntaxcomplete
imap <leader><tab> <C-p>

" ftplugins and indent files
filetype plugin on
filetype indent on

" Omnicomplete
set ofu=syntaxcomplete#Complete

" syntax highlighting
syntax on

" allow hiding of modified buffers
set hidden

" stuff that needs organization
set guifont=Inconsolata:h14
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

" Quicker command mode
nmap ; :

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
autocmd FileType eruby
  \ imap <leader>/ </<C-X><C-O><Right>

" automatically re-source vimrc on save vimrc
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif


map <S-T> :%s/\s\+$//<CR>

" Execute open rspec buffer
" " Thanks to Ian Smith-Heisters
function! RunSpec(args)
  if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
    let spec = b:rails_root . "/script/spec"
  else
    let spec = "rspec"
  end
  let cmd = ":! " . spec . " % -cfn " . a:args
  execute cmd
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map !s :call RunSpec("-l " . <C-r>=line('.')<CR>)<CR>
" run full rspec file
map !S :call RunSpec("")<CR>
map !Rs :call RunSpec("spec")

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <leader>l :TlistToggle<CR>
map <F8> :!/usr/local/bin/ctags -R --exclude=.git --exclude=log * ~/.rvm/gems/ruby-1.8.7-p352@rails30/*<CR>

set statusline=%<%f\ %h%w%m%r%y%=%{fugitive#statusline()}\ L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')})

"" Git mappings
map <C-h> :diffget //2\| :diffup<CR>
map <C-l> :diffget //3\| :diffup<CR>

function Rrestart()
  let file = b:rails_root . "/tmp/restart"
  let cmd = ":! touch " . file
  execute cmd
endfunction

function Rlogs()
  let log = b:rails_root . "/log/development.log"
  let cmd = ":! tail -n 50 -f " . log
  execute cmd
endfunction

command RLogs call Rlogs()
command RRestart call Rrestart()

" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
" This requires the %% mapping found below.
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bundle exec rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

nnoremap <leader><leader> <c-^>

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":!bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>


function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! RemoveErbTags()
  exec ':%s/<%=//g'
  exec ':%s/<%//g'
  exec ':%s/%>//g'
endfunction

command RemoveErbTags :call RemoveErbTags()


:set pastetoggle=<F3>

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

color desert256
""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

let g:SuperTabDefaultCompletionType = "<c-x><c-o>""
let g:solarized_termcolors=256
set t_Co=16
set background=dark
colorscheme tomorrow
:hi LineNr ctermfg=95

au! BufRead,BufNewFile *.json set filetype=json
au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty
au FileType xml  command -range=% -nargs=* Tidy <line1>,<line2>! xmllint --format --encode UTF-8 -
au FileType html command -range=% -nargs=* Tidy <line1>,<line2>! tidy -i -xml --show-errors 0 2>/dev/null

" splits
map <C-w><Bar> :vertical split<Cr>
map <C-w>- :split<Cr>

map t :tabnew<Cr>
map [ :tabprev<Cr>
map ] :tabnext<Cr>

map! <C-H> :set hlsearch! hlsearch?<CR>

" Command-T
map <C-p> :CommandT<Cr>
map <leader>p :CommandTFlush<Cr>


let g:SuperTabDefaultCompletionType = "<c-x><c-n><c-p>"

highlight Pmenu ctermbg=238 gui=bold
highlight PmenuSel ctermfg=238 gui=bold
highlight Search ctermfg=Black
highlight Visual ctermfg=Black
