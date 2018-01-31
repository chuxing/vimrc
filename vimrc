"  General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible   "设定 gvim 运行在增强模式下,不使用vi的键盘模式"
set helplang=cn    "设置帮助的语言"
set history=700    "显示历史
set clipboard=unnamedplus
filetype plugin indent on  "为特定的文件类型允许插件文件的载入
filetype off   
"解决vim中文乱码方法：
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileformats=unix,dos,mac
"折叠
set fdm=indent
"zm 关闭所有折叠
"zr    打开所有折叠
" 设置折叠区域的宽度 
set foldcolumn=0
"   设置折叠层数为
setlocal foldlevel=1
" " 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
" "设置代码块折叠后显示的行数
set foldexpr=1
"打开时返回上一次退出时的位置， Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
"Remember info about open buffers on close
set viminfo^=%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colors and Fonts and Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable         "语法高亮
"colorscheme evening
"colorscheme solarized
"let g:solarized_termcolors=256
"colorscheme molokai
"let g:molokai_termcolors=256
set background=dark
"高亮当前行可以其中guibg和guifg修改的是下划线的颜色；ctermbg和ctermfg修改的是背景的颜色，可以删去，仅保留下划线。
"black, brown, grey, blue, green, cyan, magenta, yellow, white。
set cursorline
":set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=purple guifg=NONE
"hi CursorColumn cterm=NONE ctermbg=white ctermfg=white guibg=darkred guifg=white
" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t 
	set guifont=Monaco:h14
	set t_Co=256               " 256 color mode
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  Text, tab and indent related, Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab     "Use spaces instead of tabs
set tabstop=4        "tab键宽度"
set smarttab      " 行首的 根据 'shiftwidth' 插入空白
set shiftwidth=4  "设定 << 和 >> 命令移动时的宽度为 4
"set softtabstop=4 "敲入tab键时实际占有的列数。
set backspace=indent,eol,start "不设定的话在插入状态无法用退格键和 Delete
"set cindent         "打开C语言缩进风格
set autoindent      "自动缩进 
set smartindent     "智能缩进 
set linebreak       "会在空白或标点符号的地方来折行
set wrap            "萤幕效果的折行"
set textwidth=500   "超过此宽度就会自动折行,在折行处会插入EOF
set noswapfile      "关闭交换文件
"set mouse=a  " 设定在任何模式下鼠标都可用"
set scrolloff=5 " 设定光标离窗口上下边界 5 行时窗口自动滚动"
set hid " 允许在有未保存的修改时切换缓冲区，此时的修改由切换由 vim 负责保存"
set autoread        " auto read when file is changed from outside
set wildignore=*.o,*~,*.pyc   "忽略编译的文件"
"set list "显示制表符"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"search and status
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch    "开启搜索时高亮
set ignorecase  "搜索忽略大小写
set smartcase   "有一个或以上大写字母时仍大小写敏感"
"set nowrapscan  " 搜索到文件两端时不重新搜索
set incsearch   " 输入搜索内容时就显示搜索结果"
set cmdheight=2 "命令行的高度 
set number      "行号
"set relativenumber  "相对行号
set showmode    "开启模式显示
set ruler       "打开状态栏标尺 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Spell checking  and others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"error sounds
set noerrorbells
set report=0        "去掉声音提示
set novisualbell
set t_vb=
set tm=500

set mat=2           " many tenths of a second to blink
set magic           " For regular expressions turn magic on"
set lazyredraw      " do not redraw while executing macros (much faster)"
set wildmenu        " Turn on the WiLd menu"
set so=7            " Set 7 lines to the cursor - when moving vertically using j/k"
" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"Change work dir to current dir
autocmd BufEnter * cd %:p:h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"去除末尾的^M :%s/\r$//g 这个是替换行尾以及单独行的 :%s/^\r//g 这个是替换行首的及单独行的
nnoremap ,m :%s/\r$//g<Enter>
nnoremap <C-f> :%s/
":%s/vivian/sky/g（等同于 ：g/vivian/s//sky/g） 替换每一行中所有 vivian 为 sky
":%s/vivian/sky/gc(每次替换都询问)
"取消查找后的高亮
nnoremap <C-z> :nohl<CR>
"全选
nnoremap <C-a> ggvG<CR> 
"复制。
nnoremap <C-c> "+yG<CR>
"粘贴
nnoremap <C-v> "+p<CR>
inoremap <C-v> <Esc> "+p<CR>
"保存
nnoremap <C-g> :w<CR>
"save and quit
inoremap ZZ <Esc> :wq<CR>
nnoremap zz :wq<CR>
"不保存退出
nnoremap <C-l> :q<CR>
"新建文件,:vs 文件名，可以打开一个文件
nnoremap <C-n> :vnew<CR>
"插入模式下移动
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
"latexF2保存并编译
nnoremap <F2> :w <CR>:call Xelatexpdf() <CR>
"latexF3打开pdf文件
nnoremap <F3>   <ESC>\lv
"F6为quickfix，查看详细信息, 两次F6关闭详细信息 
nnoremap <F6> :cw<CR> 
nnoremap <F6><F6> :ccl<CR> 
"打开taglist "ctrl+w,w：按住ctrl键，同时按下两次w键，从一个窗口切换到另一个窗口
"nnoremap <F7> :TlistToggle <cr>
autocmd FileType c,cpp  nnoremap <C-F9> :w<cr>:make<cr>
nnoremap<F9> :call CompileRun()<CR>
nmap <silent> <F8> :TagbarToggle<CR>
nnoremap <F7> :NERDTreeToggle <cr>
"C-F12刷新ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
"C-F11刷新cscope
nnoremap<C-F11> :call Do_CsTag()<CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
inoremap <F8> <C-x><C-o><C-n>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"一键编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set makeprg=g++\ -Wall\ -o\ %<.exe\ %
func! CompileRun()
	exec "w"
	if &filetype=='cpp'
		exec "!g++ % -g -o %<.exe"
		exec "!./%<.exe"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype=='ruby'
		exec "!ruby %<.rb"
	elseif &filetype == "haskell"
		exec "!ghc --make %<.hs -o %<"
		exec "! %<.exe"
	elseif &filetype == "perl"
		exec "!perl %<.pl"
	elseif &filetype == "python"
		exec "!python %<.py"
	elseif &filetype == "lua"
		exec "!lua %<.lua"
	elseif &filetype == "sh"
		exec "!bash %<.sh"
	elseif &filetype == "go"
		exec "!gccgo -Wall %<.go -o %<"
		exec "! ./%<"
	elseif &filetype == "make"
		exec "!colormake"
		exec "! ./app"
	elseif &filetype == "io"
		exec "!io %<.io"
	endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""自动加空格,||和|不能用
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au FileType c,cc,cpp,h,html,python,java :call Cp()
"fu Cp()
	"ino , ,<SPACE>
	"ino ; ;<SPACE>
	"ino <= <SPACE><=<SPACE>
	"ino *= <SPACE>*=<SPACE>
	"ino /= <SPACE>/=<SPACE>
	"ino >> <SPACE>>><SPACE>
	"ino << <SPACE><<<SPACE>
	"ino >= <SPACE>>=<SPACE>
	"ino == <SPACE>==<SPACE>
	"ino += <SPACE>+=<SPACE>
	"ino -= <SPACE>-=<SPACE>
	"ino && <SPACE>&&<SPACE>
	"ino != <SPACE>!=<SPACE>
	"ino = <SPACE>=<SPACE>
	"ino ^ <SPACE>^<SPACE>
"endf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"latex用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
function! Xelatexpdf()
	w!
	"确保万一，保存文档
	let cline = line(".")
	"cline是执行编译时光标行号
	let gline = cline - 5
	"gline是放置标记的地方，可以往前挪动一点，
	"以便打开PDF时可以看到当前行，5是可以自己设置的提前量
	execute 'silent! g/\\hypertarget{Atemporal}{ }/d'
	"查找PDF named destination的生成行并删除
	"注意应该和后面保持一致
	execute 'silent! /end{document}'
	"找到文档末尾
	let eline = line(".")
	"eline是文档末尾行
	if gline >= eline
		let gline = eline - 5
	endif
	"如果设置的光标位已经在文档末尾后，改到文档末尾之前
	execute 'silent! /begin{document}'
	let bline = line(".")
	"bline是文档开始行
	if gline <= bline
		let gline = bline + 1
	endif
	"如果设置光标位在文档开始前，改到文档开始后
	setlocal makeprg=pdfopen
	let execString1 = 'silent! make --file='.expand('%:p:r').'.pdf'
	execute execString1
	"首先试图用pdfopen打开与当前tex文档对应的PDF文档
	"因为必须用这种方法打开的才能用pdfclose关闭
	setlocal makeprg=pdfclose
	execute execString1
	"用pdfclose确保对应PDF文档已经关闭
	execute gline
	"光标跑到指定位置
	put ='\hypertarget{Atemporal}{ }'
	"设置一个标记，编译后生成named destination，名称是Atemporal
	"可以修改名称，但是前后要一致。这是将来打开PDF时直接跳到的位置
	w! "保存
	setlocal makeprg=xelatex
	let execString2 = 'silent! !xelatex '.expand('%')
	execute execString2
	"用xelatex编译当前文档生成PDF
	setlocal makeprg=pdfopen
	let execString3 = 'silent! make --file='.expand('%:p:r').'.pdf --goto=Atemporal'
	execute execString3
	"用pdfopen打开相应PDF文档，并跳到Atemporal的位置
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Bundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"必须有下面这一条语句
Bundle 'gmarik/vundle'   
filetype indent plugin on
"状态栏
Bundle 'Lokaltog/vim-powerline'  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf8
let g:Powerline_stl_path_style = 'full'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"查看函数跳转
"Bundle 'cscope.vim'
"Bundle 'cecscope'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"sudo apt-get install cscope
"目录下执行命令cscope -bq(更新的话需要重新置)
function Do_CsTag()
	if(executable('cscope') && has("cscope") )
		if(g:iswindows!=1)
			silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		else
			silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		endif
		silent! execute "!cscope -Rbqk"
	endif
endf
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	"set cscopequickfix=s-,c-,d-,i-,t-,e-
	if filereadable("cscope.out")
		execute "cs add cscope.out"
	endif
	set csverb
endif
"F6打开所有的函数调用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多光标批量操作
"Bundle 'vim-multiple-cursors'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"会导致方向键失效
"ctrl + n 开始选择
"ctrl + p 向上取消
"ctrl + x 跳过
"esc   退出
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"php补全
"Bundle 'phpcomplete.vim'
"主题
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
"github用
Bundle 'airblade/vim-gitgutter'
"自动补齐括号
Bundle 'Raimondi/delimitMate'
"用于查看类
Bundle 'majutsushi/tagbar'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_left=1 
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"github所用插件
Bundle 'tpope/vim-fugitive'

"片段补全
Bundle 'snipMate'
"python 字典补全
Bundle 'Pydiction'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语法检查
"Bundle 'Syntastic'
"原型提示
Bundle 'echofunc.vim'
"参数补全的功能 ,先C-12建立tags
Bundle 'code_complete'
Bundle 'ctags.vim'
"先sudo apt-get install 安装ctags
set tags=tags;
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"将光标停留在一个函数或变量上，"ctrl+]"，将直接跳转到定义该函数的地方。
"ctrl+t回到原来跳转前的地方，连续按两下’’可以再回去。
"C-n,c-p选择不同的函数原型，输入函数名和( 后c-a补全函数参数列表
let g:EchoFuncKeyNext='<C-n>'
let g:EchoFuncKeyPrev='<C-p>'
let g:completekey="<c-a>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"对配对符号-surrounding的操作
Bundle 'surround.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ds  - delete a surrounding
"cs  - change a surrounding
"yss - add a surrounding to the whole line
"Visual mode
"S   - in visual mode, add a surrounding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"记录之前多次的复制记录"
"Bundle 'YankRing.vim' 
"查找文件的插件，C-p打开，可以搜索文件
Bundle 'ctrlp.vim'
"神级插件，ZenCoding可以让你以一种神奇而无比爽快的感觉写HTML、CSS
Bundle 'ZenCoding.vim'
"在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'
"JS代码格式化插件；
Bundle '_jsbeautify'
"用全新的方式在文档中高效的移动光标，革命性的突破
Bundle 'EasyMotion'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ','
",, + w  找下文
",, + b 找上文
",, + f+字符  查找某个字符,快速跳转定位到下文某个字符位置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动识别文件编码；
Bundle 'FencView.vim'
"必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChristmasTree=1 
let NERDTreeAutoCenter=1 
let NERDTreeMouseMode=2 
let NERDTreeShowBookmarks=1 
let NERDTreeShowFiles=1 
let NERDTreeShowHidden=1 
let NERDTreeShowLineNumbers=1 
let NERDTreeWinPos='left' 
let NERDTreeWinSize=30
let Tlist_GainFocus_On_ToggleOpen=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERD出品的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码；
Bundle 'The-NERD-Commenter'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"v选中多行，然后,cc( ,cm ,cs)加上注释  (,cu)解开注释
nmap <C-/> ,cc<CR>
nnoremap <C-/></> ,cu<CR>
"normal下直接 n命令 就可，n表示以下的几行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码。
"Bundle 'UltiSnips'
"让代码更加易于纵向排版(以自己想要的方式对齐),假如我想让其中的多行按'='对齐，则将光标定位到有等号的那行，执行 :Tab /= 即可
Bundle 'Tabular'
"迄今位置最好的自动VIM自动补全插件了吧,Vundle的这个写法，是直接取该插件在Github上的repo
"Bundle 'Valloric/YouCompleteMe'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = []
let g:ycm_min_num_of_chars_for_completion = 1
"正常模式下,g实现函数跳转
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"缓存补全
Bundle 'neocomplcache'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menuone  "补全中去掉预览窗口的显示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C类语言的语义分析补全
Bundle 'clang-complete'
"边写边查找
Bundle 'AutoComplPop'
"Bundle  'SuperTab'
"python补全
Bundle  'davidhalter/jedi'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码对齐
Bundle "jreybert/vim-align"
Bundle 'junegunn/vim-easy-align'
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
	  let g:easy_align_delimiters = {}
  endif
  let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
"sql 格式化
Bundle 'smintz/vim-sqlutil'
vmap <slient>sf <Plug>SQLU_Formatter<CR>
nmap <slient>sf <Plug>SQLU_Formatter<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pyclewn
"http://pyclewn.sourceforge.net/install.html - 安装python-dev，pip
":Pydiction, :Cfile,:Cmapkeys,:Cinferiortty
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"各种补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType java set omnifunc=javacomplete#Complete
"autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType html inoremap <buffer> . .<C-X><C-O><C-P>
autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
"autocmd FileType cpp inoremap <buffer> . .<C-X><C-O><C-P>
autocmd FileType python inoremap <buffer> . .<C-X><C-O><C-P>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
