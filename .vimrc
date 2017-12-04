"basic"
execute pathogen#infect()
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set t_Co=256
set background=dark
colorscheme wombat256mod
syntax enable
syntax on
set ignorecase
highlight clear LineNr
set smartcase
set hlsearch
set expandtab
set number
set ma
set relativenumber
set clipboard=unnamed
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
"set nocursorline"
set cursorcolumn
set cursorline
nmap <Left> gT
nmap <Right> gt

"Header"
au BufNewFile *.py 0r /Users/WeinanLi/Documents/OneDrive/Document/coding_related/header.template

"JS-Standard-Style"
autocmd bufwritepost *.js silent !standard --fix %
set autoread
"JS-Standard-Style"

"vundel"
set nocompatible              " be iMproved, required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'alvan/vim-closetag'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'

call vundle#end()            " required
filetype plugin indent on
"vundel"

"airline configuration"
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:bufferline_echo=0
set laststatus=2
set t_Co=256

"Tagbar"
nmap <F8> :TagbarToggle<CR>
"NERDtree"
nmap <Down> :NERDTreeToggle<CR>
nmap <Up> <C-w>w

"writebackup"
let g:WriteBackup_BackupDir = '/Users/WeinanLi/Documents/OneDrive/Document/vim_backups'

"trailing useless whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType sh,vim,asm,c,cpp,java,go,php,javascript,puppet,python,rust,twig,tex,xml,yml,perl,markdown.mkd
      \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
