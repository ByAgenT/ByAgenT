" Disable vi support and turn off filetypes for the plugin manager.
set nocompatible
filetype off

"========================
" PLUGINS
"========================

" Setup plugins using Vim Plug
call plug#begin()

" == Common plugins ==

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Tree viewer for files
Plug 'scrooloose/nerdtree'

" Commenting for different languages
Plug 'scrooloose/nerdcommenter'

" Support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" Support for multiple cursors
Plug 'terryma/vim-multiple-cursors'

" GitGutter shows difference in git revisions
Plug 'airblade/vim-gitgutter'

" Plugin for smart working with parenthesis, brackets, etc.
Plug 'tpope/vim-surround'

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

" Language specific plugins
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'

" Install CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" UI plugins
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

call plug#end()

"========================
" COC CONFIGURATION
"========================

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-python', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-rust-analyzer', 'coc-clangd']

"========================
" MAIN SETTINGS
"========================

" Set default shell to zsh
set shell=/bin/zsh

" Enable better copy and paste
set pastetoggle=<f4>
set clipboard^=unnamedplus

" Mouse and backspace
set mouse=a
set mousehide
set bs=2

" Set line breaks, matching brackets, etc.
set linebreak
set showmatch
set autoread

" Disable showing of spaces.
set invlist

" Disable swap file
set nobackup
set noswapfile

"Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cindent
set smartindent
set number

" Set encoding if running Vim
set encoding=UTF-8

" Misc tweaks
set cursorline      " Highlight current line
set ignorecase      " Make commands case insensitive
set ttyfast         " Scroll fast
set updatetime=300  " Update more often

"========================
" UI & INTERFACE
"========================

if (has("termguicolors"))
    set termguicolors
endif
set linespace=1
set encoding=utf-8
colorscheme nord
set background=dark
set guifont=Roboto\ Mono\ Light\ for\ Powerline:h13
let g:enable_bold_font = 1

" Give more space for displaying messages.
set cmdheight=2



"========================
" OTHER
"========================

" Airline settings
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Make settings for C/C++
au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %


" NERDTree settings
let NERDTreeIgnore=['\.pyc$']
let NERDTreeHighlightCursorline=1


" EditorConfig settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" Settings for invisible characters
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

"============
" KEY MAPPINGS
"============

"Rebind Leader key
let mapleader = ","

" Switch NERDTree
map <F3> :NERDTreeFocus<CR>
" Focus NERDTree
"map <C-t> :NERDTreeFocus<CR>
" Switch focus on the next frame
map <C-e> :wincmd w<CR>

" Show spaces as characters.
map <F12> :set invlist<CR>

" Quick save
noremap <C-Z> :w<CR>
vnoremap <C-Z> <C-C> :w<CR>
inoremap <C-Z> <C-O> :w<CR>

" Quick exit
noremap <Leader>q :quit<CR>
noremap <Leader>e :q<CR>
noremap <Leader>E :qa!<CR>

" Save and exit
map <Leader>s :wq<CR>

" Movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Movement between buffers
map <Leader>b <esc>:bnext<CR>
map <Leader>B <esc>:bprevious<CR>

" Movement between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Move code blocks in visual mode
vnoremap < <gv
vnoremap > >gv

" Disable arrow keys for VIM learning
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[


" Setup CoC keybinds

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OptimizeImports :call CocActionAsync('runCommand', 'editor.action.organizeImport')


" FZF keybinds
map <Leader>ff :Ag<CR>
map <Leader>fd :Files<CR>
map <Leader>fb :Buffers<CR>

"========================
" AUTOMATION
"========================

autocmd VimEnter * NERDTree
autocmd VimEnter * Tagbar
autocmd VimEnter * wincmd w
autocmd CompleteDone * pclose


" Tagbar setup
"
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'i:instance:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type',
        \ 'i' : 'instance'
    \ },
    \ 'scope2kind' : {
        \ 'module'   : 'm',
        \ 'class'    : 'c',
        \ 'data'     : 'd',
        \ 'type'     : 't',
        \ 'instance' : 'i'
    \ }
\ }

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
