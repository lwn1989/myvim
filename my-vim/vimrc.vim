"==========================================
" About:  Config file for vim
"         Vim 配置文件
"         --- 无插件版 ---
" Author: Xiang,Zuo
" Email:  xianglinks@gmail.com
"==========================================

"==========================================
" General Settings 基础设置
"==========================================

" 开启语法高亮功能
syntax enable
syntax on

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" history存储容量
set history=2000

" 允许插件
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" 启动自动补全
filetype plugin indent on

" 自动载入文件
set autoread

" 关闭兼容模式
set nocompatible
" 取消备份
set nobackup

" 关闭交换文件
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" vim 自身命令行模式智能补全
set wildmenu

" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=

" 修复ctrl+n 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" 关闭鼠标
set mouse-=a
set mousehide               " Hide the mouse cursor while typing

" Remember info about open buffers on close
set viminfo^=%
" For regular expressions turn magic on
set magic

" w!! 非root情况下进行保存
cmap w!! w !sudo tee >/dev/null %

" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

" 恢复编辑退出时的光标位置
" Restore cursor position when opening file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 关闭scratch弹窗-Python补全的时候
set completeopt-=preview

"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 开启行号显示
set number
" 禁止折行
set nowrap

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=8

" 括号配对情况,跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 高亮显示当前行/列
set cursorline
set cursorcolumn

"设置文内智能搜索提示
  " 高亮search命中的文本
  set hlsearch
  " 打开增量搜索模式,随着键入即时搜索
  set incsearch
  " 搜索时忽略大小写
  set ignorecase
  " 有一个或以上大写字母时仍大小写敏感
  set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" tab 默认配置
set tabstop=2     " 设置Tab键的宽度 [等同的空格个数]
set shiftwidth=2  " 每一次缩进对应的空格数
set softtabstop=2 " 按退格键时可以一次删掉的空格数
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉n个空格
set expandtab     " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}

set foldmethod=indent
set foldlevel=99

" 启动 vim 时关闭折叠代码
set nofoldenable

" 缩进配置
set autoindent    " 打开自动缩进

" 相对行号
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 中文帮助
set helplang=cn
"set langmenu=zh_CN.UTF-8
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

"==========================================
" Keyboard Settings  自定义快捷键设置
"==========================================

" 定义快捷键的前缀，即<leader>
let mapleader=","

"Map ; to : 用于快速进入命令行
nnoremap ; :

" kj 替换 Esc
inoremap kj <Esc>

" 关闭方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 删除一行(不放入缓存)
nnoremap <leader><leader>x "_d
vnoremap <leader><leader>x "_d

" 定义快捷键到行首和行尾
nmap lb 0
nmap le $

" 将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 将系统剪贴板内容粘贴至vim
nmap <leader>p "+p

" 关闭当前分割窗口
nmap <leader>q :q<CR>
" 放弃保存退出窗口
nmap <leader>Q :q!<CR>
" 保存当前窗口内容
nmap <leader>w :w<CR>

" 在结对符之间跳转，助记pair
nmap <leader>pa %

"Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 全选
map <leader>sa ggVG"

" 复制全部到系统剪切板
map <leader><leader>ca :%y+<CR>

" 区块选择
nnoremap <leader>v V`}

" 取消搜索高亮
nmap <leader><leader>n :noh<CR>

" 空格进入搜索 使用正则表达式
map <space> /
nnoremap / /\v
vnoremap / /\v

" 快速编辑vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" 改变窗口大小
nmap w=  :resize +3<CR>
nmap w-  :resize -3<CR>
nmap w,  :vertical resize -3<CR>
nmap w.  :vertical resize +3<CR>

" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 行首行行尾跳转
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 将搜索结果显示在屏幕中央
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" == 字符替换 ===
" -----------------------------------------------------------------------------
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
  wa
  let flag = ''
  if a:confirm
      let flag .= 'gec'
  else
      let flag .= 'ge'
  endif
  let search = ''
  if a:wholeword
      let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
  else
      let search .= expand('<cword>')
  endif
  let replace = escape(a:replace, '/\&~')
  execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" 不确认、非整词
nnoremap <leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" -----------------------------------------------------------------------------

" === tab/buffer相关 ===
" -----------------------------------------------------------------------------
" Buffer 相关
  " 列出Buffer
  nnoremap <Leader>l :ls<CR>
  " 方向键切换buffer
  nnoremap [b :bprevious<cr>
  nnoremap ]b :bnext<cr>
  noremap <left> :bp<CR>
  noremap <right> :bn<CR>

  " 切换到确切的buffer
  map <leader>1 :b 1<CR>
  map <leader>2 :b 2<CR>
  map <leader>3 :b 3<CR>
  map <leader>4 :b 4<CR>
  map <leader>5 :b 5<CR>
  map <leader>6 :b 6<CR>
  map <leader>7 :b 7<CR>
  map <leader>8 :b 8<CR>
  map <leader>9 :b 9<CR>

" Tab 相关
  map <leader>th :tabfirst<cr>
  map <leader>tl :tablast<cr>

  map <leader>tj :tabnext<cr>
  map <leader>tk :tabprev<cr>
  map <leader>tn :tabnext<cr>
  map <leader>tp :tabprev<cr>

  map <leader>te :tabedit<cr>
  map <leader>td :tabclose<cr>
  map <leader>tm :tabm<cr>

  " 新建tab
  nnoremap <C-t>     :tabnew<CR>
" -----------------------------------------------------------------------------

" === F1 - F10 ===
" -----------------------------------------------------------------------------
" F1: 关闭帮助提示
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" F2: 行号显示
nnoremap <F2> :call HideNumber()<CR>
  function! HideNumber()
    if(&relativenumber == &number)
      set relativenumber! number!
    elseif(&number)
      set number!
    else
      set relativenumber!
    endif
    set number?
  endfunc

" F3: 语法检测及高亮
map <F3> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" -----------------------------------------------------------------------------

"==========================================
" FileType Settings  文件类型设置
"==========================================

" 根据源码类型载入配置和片段
" -----------------------------------------------------------------------------
" --- 载入配置 ---
  autocmd FileType asm set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  autocmd FileType c set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd FileType cpp set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

  autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set tabstop=2 shiftwidth=2 noexpandtab
  autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown  set filetype=markdown.mkd

" --- 载入常用片段 ---
  " h, hpp 头文件插入gates
  function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
  endfunction
  autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
" -----------------------------------------------------------------------------

" 保存源码时删除多余空格
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
" 选择作用的文件类型
autocmd FileType sh,vim,asm,c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 高亮特殊字符
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" 特定源码快捷键
" ### Python ###
  au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

"==========================================
" others 其它设置
"==========================================

autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
  " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
  set completeopt=longest,menu
  " 增强模式中的命令行自动完成操作
  set wildmenu
  " 忽略已编译文件
  set wildignore=*.o,*~,*.pyc,*.class

"==========================================
" Theme Settings  主题设置
"==========================================

" 配色方案
  " 终端256色显示
  set t_Co=256
  " 背景暗色
  set background=dark
  " set background=light
  " 常用配色方案
    colo wombat256
    " colo seoul256
    " colo seoul256-light
    " colo gruvbox
    " colo Tomorrow-Night

" GUI设定
  set guifont=Monaco\ 10
  set guicursor=a:blinkon0
  " 禁止光标闪烁
  set gcr=a:block-blinkon0
  " 禁止显示滚动条
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  " 禁止显示菜单和工具条
  set guioptions-=m
  set guioptions-=T
  set guitablabel=%M\ %t
  set showtabline=1
  set linespace=2
  set noimd

  " 设置标记一列的背景颜色和数字一行颜色一致
  hi! link SignColumn   LineNr
  hi! link ShowMarksHLl DiffAdd
  hi! link ShowMarksHLu DiffChange

  " 错误高亮配置，防止错误整行标红导致看不清
  highlight clear SpellBad
  highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
  highlight clear SpellCap
  highlight SpellCap term=underline cterm=underline
  highlight clear SpellRare
  highlight SpellRare term=underline cterm=underline
  highlight clear SpellLocal
  highlight SpellLocal term=underline cterm=underline
