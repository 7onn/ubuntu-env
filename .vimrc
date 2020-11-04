"""""" VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Any valid git URL is allowed

"""""" Directory management and travel
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"""""" Syntax highlighting
Plug 'sheerun/vim-polyglot'

"""""" Linting and Completion
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""" Vim read .editorconfig file
Plug 'editorconfig/editorconfig-vim'

"""""" Allow multiple cursors on vim
" Plug 'terryma/vim-multiple-cursors'

"""""" Auto insert quotes, parentheses, brackets, braces
Plug 'jiangmiao/auto-pairs'

""" Onedark theme
Plug 'joshdick/onedark.vim'

"""""" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"""""" Syntax highlighting js
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'

call plug#end()

"""""" Custom
syntax on
filetype plugin on
" set omnifunc=syntaxcomplete#Complete
" set omnifunc=ale#completion#OmniFunc
set number relativenumber
set numberwidth=2
set breakindent
set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set ruler
set cursorline
set colorcolumn=80,120
set nowritebackup
set noswapfile
set nobackup
set t_Co=256

" let mapleader = ","
let mapleader = "\<Space>"

" Theme
colorscheme onedark

" Panels navigation
nnoremap <C-H> <C-W><C-H>
" Same as:
" nnoremap <silent> <C-H> :wincmd h
nnoremap <C-J> <C-W><C-J>
" Same as:
" nnoremap <silent> <C-J> :wincmd j
nnoremap <C-K> <C-W><C-K>
" Same as:
" nnoremap <silent> <C-K> :wincmd K
nnoremap <C-L> <C-W><C-L>
" Same as:
" nnoremap <silent> <C-L> :wincmd L

" Buffers config
""" Buffer navigation
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>
""" Buffer deletion
nnoremap <silent> <Leader>bd :bd<CR>

function! SourceFileIfExists(filename)
  let l:extra_file = fnamemodify(expand($MYVIMRC), ':p:h') . '/system-config/.config/vim/' . a:filename
  if filereadable(l:extra_file)
    execute ':so ' . l:extra_file
  endif
  unlet l:extra_file
endfunc

call SourceFileIfExists('airline.vim')
call SourceFileIfExists('ale.vim')
call SourceFileIfExists('ale-mappings.vim')
call SourceFileIfExists('coc.vim')
call SourceFileIfExists('nerdtree.vim')