"""""""""""""""""
" vim-plug setup"
"""""""""""""""""
call plug#begin('~/.vim/plugged')

" fuzzy finder " fuzzy find in different contexts, commands :  Files GFiles Commits Buffers Marks Commands Windows History Lines Tags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'

" ctrlfs + ripgrep
Plug 'https://github.com/dyng/ctrlsf.vim'

" majutsushi tagbar " ctags based overview in a sidebar for general prog languages, mapped to F8
Plug 'https://github.com/majutsushi/tagbar'

" vim-airline nice status line
Plug 'https://github.com/vim-airline/vim-airline'

" multiple cursors " CTRL-n nexmatch CTRL-x skip match CTRL-p delete match
Plug 'https://github.com/terryma/vim-multiple-cursors'

" unix commands to current file " Delete Move Rename Cfind ? 
Plug 'https://github.com/tpope/vim-eunuch'

" surround region " cs<> ds<> yi?<> yss
Plug 'https://github.com/tpope/vim-surround'
" expand-region
Plug 'https://github.com/terryma/vim-expand-region'

" nerdtree - mapped to F3
Plug 'https://github.com/scrooloose/nerdtree'

" vim-bufferline shows bufferline in status
Plug 'https://github.com/bling/vim-bufferline'

" bufexplorer open buffer list in window, vertical and horizontal split '\be' '\bv' '\bs'
Plug 'https://github.com/vim-scripts/bufexplorer.zip'

" ctrlp - CTRL-p change mode CTRL-f, reset F5
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" fugitive :GStatus :GBlame :GCommit 
Plug 'https://github.com/tpope/vim-fugitive'

" yankstack ALT-l and ALT-L to change previous yanks :Yanks to see yanks
Plug 'https://github.com/maxbrunsfeld/vim-yankstack'

" gutentag - for ctags
Plug 'https://github.com/ludovicchabant/vim-gutentags'

" snipmate - press TAB for different lang elements, for, if, etc. FIXME is it needed ?
Plug 'https://github.com/garbas/vim-snipmate'
" mw-utils - for snipmate
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
" tlib for vim-snippets
Plug 'https://github.com/tomtom/tlib_vim'
Plug 'https://github.com/honza/vim-snippets'

" badwolf color scheme - just a color scheme
Plug 'https://github.com/sjl/badwolf/'

" vimpager - use vim as pager 'vimpager'
Plug 'https://github.com/rkitover/vimpager'

call plug#end()

" :term CTRL-\ CTRL-n to buffer mode

"""""""""""""""""
" plugin hotkeys"
"""""""""""""""""
" TagBar
nmap <F8> : TagbarToggle<CR> 
" NerdTree
nmap <F3> : NERDTreeToggle<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"CtrlFS+ripgrep
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" yankstack map to meta-l and meta-L
nmap <A-l> <Plug>yankstack_substitute_older_paste
nmap <A-L> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""
"general vim config"
""""""""""""""""""""

" change dir to home for nerdtree
cd ~

" nice colors
color badwolf
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
  set guifont=guifont=Hack:h8:cEATEUROPE:qDRAFT
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Set numbers  
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
