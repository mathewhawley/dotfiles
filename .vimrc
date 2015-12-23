" Mathew Hawley – MacVim

" {{{ Plugins

call plug#begin('~/.vim/plugged')

" tools
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'wellle/visual-split.vim'

" colours
Plug 'akmassey/vim-codeschool'

" syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'

" editing
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'

call plug#end()

" }}}
" {{{ General

set nocompatible " enable all improvements
set history=1000 " how many lines of history to remember
set undolevels=1000 " how many undos
set encoding=utf-8 " set utf8 as standard encoding
set noerrorbells " no sound on error
set novisualbell " no visual on error
set hidden " switch between buffers without saving
set autoread " automatically refresh changed files
set directory^=$HOME/.vim/swaps// " store swap files in ~/.vim/swaps
set backup^=$HOME/.vim/backups// " store backup files in ~/.vim/backups
set undodir^=$HOME/.vim/undo// " store undo history in ~/.vim/undo

" }}}
" {{{ Colors, Fonts & Themes

syntax enable
set background=dark " dark background
set t_Co=256 " 256 colors
colorscheme codeschool
set guifont=Roboto\ Mono\ Light\ for\ Powerline:h11
set linespace=1

" }}}
" {{{ UI Config

set number " show line numbers
set relativenumber " line numbers relative to cursor
set cursorline " highlight current line
set showcmd " show command in bottom bar
set cmdheight=1 " the command bar is 1 high
set ruler " show current position along bottom
set wildmenu " visual autocomplete for command menu
set wildmode=list:longest:full " turn on wild menu in special format (long format)
set lazyredraw " redraw only when needed
set showmatch " show matching brackets
set guioptions-=r " hide right scrollbar
set guioptions-=L " hide left scrollbar
set list " show whitespace
set listchars=tab:▸\ ,eol:¬,trail:· " whitespace characters

" git gutter
let g:gitgutter_enabled=1
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='■'
let g:gitgutter_sign_removed='-'
let g:gitgutter_removed_first_line='⁂'
let g:gitgutter_sign_modified_removed='×'

" }}}
" {{{ Spaces & Tabs

set tabstop=4 " number of spaces per TAB
set softtabstop=4 " number of spaces of TAB when editing
set expandtab " turn tabs into spaces
set shiftwidth=4 " when indenting with '>' use 4 spaces
set modelines=1 " modeline at bottom of this file
set breakindent " wrapped lines adhere to indentation
set backspace=indent,eol " allow backspace across indentation and lines

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

au BufWritePre *.hbs,*.js,*.scss,*.json,*.html,*.css,*.rb :call <SID>StripTrailingWhitespaces() " strip trailing whitespace on save

" }}}
" {{{ Searching

set incsearch " highlight as you type search phrase
set hlsearch " highlight matches
set ignorecase " ignore case when searching
set smartcase " if using capitals include capitals
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git\|dist' " folders to ignore in ctrlp
let g:ctrlp_root_markers=['pom.xml'] " additional root markers for ctrlp

" }}}
" {{{ Filetypes

filetype on
filetype plugin indent on
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.json set filetype=javascript
set omnifunc=syntaxcomplete#Complete " turn on omnicompletion
let g:used_javascript_libs='jquery,handlebars,react,underscore' " js syntax libs to include

" }}}
" {{{ Folding & Splits

" folding
set foldenable " enable folding
set foldlevelstart=100 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
nnoremap <space> za " toggle folds open/close with 'space' key

" splits
set splitbelow " open new split below current
set splitright " open new split to right of current
nnoremap <C-c> :bp\|bd #<CR> " close buffer but keep split

" }}}
" {{{ Movement

set scrolloff=5 " offset landing by 5 lines
set virtualedit=all " enable movement into 'invalid' spaces

" }}}
" {{{ Statusline

set laststatus=2 " always show statusline

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1 " show buffers
let g:airline_powerline_fonts=1 " use powerline font
let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='␤'
let g:airline_symbols.whitespace='Ξ'

" }}}
" {{{ NERDTree

" autocmd vimenter * NERDTree " load on vim start
let g:NERDTreeWinSize=40 " set default width
map <C-n> :NERDTreeToggle<CR> " shortcut to toggle NERDTree

" }}}

" vim:foldmethod=marker:foldlevel=0
