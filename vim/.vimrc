""""""""""""""""""""""""""""
" Vim Configuration
""""""""""""""""""""""""""""

" Use Vim settings
set nocompatible

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

""""""""""""""""""""""""""""
" Plug setup
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'max-baz/lightline-ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'

Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

call plug#end()

"""""""""""""""""""""""""""
" Basic Configuration
"""""""""""""""""""""""""""
filetype on
filetype plugin indent on
syntax on
syntax enable
runtime macros/matchit.vim

set mouse=a
set mousemodel=popup_setpos

" => Encoding
set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,mac,dos

" => Backup and history
set hidden
set nobackup
set nowritebackup
set backupdir=
set directory=
set history=1000
set undolevels=1000
set noswapfile

" => Indentation and text options
set autoindent
set smartcase
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set formatoptions-=t
set textwidth=80
set nowrap
set backspace=indent,eol,start

" => Behavior
set splitright
set splitbelow
set modeline
set showcmd
set showmode
set clipboard=unnamed
set ttyfast
au FileType * setlocal formatoptions-=cro " Turn off autocommenting

" => Searching
set ignorecase
set smartcase
set incsearch

" => Completion
set omnifunc=ale#completion#OmniFunc
set completeopt=menuone,menu,longest
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class

" => User interface
set title
"set statusline=%F%m%r%h%w=(%{%ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set laststatus=2
set noerrorbells
set visualbell
set t_vb=
" Getting Tmux to work with the color scheme
set t_ut=
set t_Co=256
set ruler
set number

" => Theme
set background=dark

"""""""""""""""""""
" Mappings
"""""""""""""""""""
" Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

" Leader key
let mapleader=","

" Use jj to switch to normal mode
map! jj <Esc>

" Moving blocks without losing focus
vnoremap < <gv
vnoremap > >gv

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""
" Lightline
"""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'fugitive', 'filename', 'modified' ]
      \             ],
      \     'right': [ [ 'lineinfo' ],
      \                [ 'filetype', 'fileformat', 'fileencoding' ]
      \              ]
      \ },
      \ 'component_function': {
      \     'fugitive': 'LightLineFugitive'
      \ }
      \}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

"let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

" Show git status if in git repository, else nothing
function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

"""""""""""""""""""
" NerdTree
"""""""""""""""""""
" Close VIM if the only window left open is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Change arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""
" NerdTree
"""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""
" CtrlP
"""""""""""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'

"""""""""""""""""""
" Ruby
"""""""""""""""""""
augroup ruby
    autocmd!
    autocmd FileType ruby setlocal st=2
    autocmd FileType ruby setlocal sw=2
    autocmd FileType ruby setlocal expandtab
augroup END

augroup vagrant
    autocmd!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

"""""""""""""""""""
" Python
"""""""""""""""""""
augroup python
    autocmd!
    autocmd FileType python setlocal ts=4
    autocmd FileType python setlocal sw=4
    autocmd FileType python setlocal expandtab
augroup END

"""""""""""""""""""
" Golang
"""""""""""""""""""
let g:go_version_warning = 0
augroup go
    autocmd!
    autocmd FileType go nmap <Leader>r <Plug>(go-run)
    autocmd FileType go nmap <Leader>t <Plug>(go-test)
    autocmd FileType go nmap <Leader>c <Plug>(go-build)
    autocmd FileType go nmap <Leader>rn <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
augroup END

let g:go_fmt_command = "goimports" " Add and remove imports on save
au filetype go inoremap <buffer> . .<C-x><C-o>

"""""""""""""""""""""""
" Javascript
"""""""""""""""""""""""
augroup javascript
    autocmd!
    autocmd FileType javascript setlocal ts=2
    autocmd FileType javascript setlocal sw=2
    autocmd FileType javascript setlocal expandtab
augroup END

let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""
" Rust
"""""""""""""""""""""""
if &filetype ==# 'rust'
    syntax enable
    let g:rustfmt_autosave = 1
    let b:ale_fixers = {'rust': ['rustfmt']}
endif

"""""""""""""""""""""""
" HTML
"""""""""""""""""""""""
augroup html
    autocmd!
    au BufRead,BufNewFile *.dust set filetype=html
augroup END

"""""""""""""""""""""""
" YAML
"""""""""""""""""""""""
augroup yaml
    autocmd!
    autocmd FileType yaml setlocal ts=2
    autocmd FileType yaml setlocal sw=2
    autocmd FileType yaml setlocal expandtab
augroup END

"""""""""""""""""""""""
" Misc stuff
"""""""""""""""""""""""

match ErrorMsg '\s\+$'

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre  * :call TrimWhiteSpace()
autocmd FileWritePre * :call TrimWhiteSpace()

set statusline+=%#warningmsg#
set statusline+=%*