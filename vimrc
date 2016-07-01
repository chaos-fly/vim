set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'                   " 文件查找
call vundle#end()            " required
filetype plugin indent on    " required

"设置leader为
let mapleader=","
let g:mapleader=","

syntax on                   " 自动语法高亮
set fileencodings=utf-8,gbk,cp936
set nocompatible            " 关闭 vi 兼容模式
"set number                  " 显示行号
set nocursorline            " 不突出显示当前行
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set expandtab               " tab 用空格代替
set nobackup                " 覆盖文件时不备份
"set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set autoread                 " set to auto read when a file changed from the outside
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
"set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
"set nowrap                  " 不自动换行
set magic                  " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set foldenable              " 开始折叠
set fdm=syntax
set foldmethod=indent "设置代码折叠方式为 手工  indent
set foldlevel=100            " 启动vim时不要自动折叠代码
"set foldexpr=1              "设置代码块折叠后显示的行数
"set foldcolumn=0            " 设置折叠区域的宽度
"set foldclose=all          " 设置为自动关闭折叠
"colorscheme molokai        " 设定配色方案
colorscheme darkblue        " 设定配色方案
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)\
                            " 设置在状态行显示的信息
" 显示Tab符
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set list

au BufNewFile,BufRead *.py 
\ set autoindent

"编辑vim配置文件
set fileformats=unix,dos,mac
nmap <Leader>e :tabnew $HOME/.vimrc<CR>

nnoremap <space> za
nmap <leader>p <C-p>

"设置编译快捷键
nmap <Leader>l :Tlist<CR>

map gt <ESC>:tabnew .<CR>
map gn <ESC>:tabnext<CR>
map gp <ESC>:tabprevious<CR>
map gw <C-w><C-w>
map fg :vertical wincmd f<CR>

" ycm 跳转命令
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"设置全选快捷键
map <C-a> ggVG

"定义CompileRun函数，用来对不用外接库的小程序进行编译和运行,自己可以根据文件名扩展或实际情况修改参数
map gj :call CompileRun()<CR>
func CompileRun()
	exec "w"
	"C++程序
	if &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!.//%<"
	elseif &filetype == 'python'
		exec 'echo "---------------------"'
		exec "!python %"
	elseif &filetype == 'lua'
		exec 'echo "---------------------"'
		exec "!lua %"
	elseif &filetype == 'sh'
		exec 'echo "---------------------"'
		exec "!bash %"
	elseif &filetype == 'go'
		exec 'echo "---------------------"'
		exec "!gol run %"
	elseif &filetype == 'java'
		exec 'echo "---------------------"'
		exec "!javac -cp /usr/local/lib/*.jar % && java %:r"
	endif
endfunc

" 添加python头
map tt :call AddPythonHead()<CR>
func AddPythonHead()
    call append(0, "#!/usr/bin/env python")
    call append(1, "#-*- coding:utf8 -*-")
endfunc

" 重新添加cscope
map bg :!/data/vip/gen_cscope.sh <CR>
map gb :!cscope -Rbq <CR>

"-----------------------------------------------------------------
let Tlist_Show_One_File = 1            "
let Tlist_Exit_OnlyWindow = 1          "
let Tlist_Use_Right_Window = 0         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1

"需下载文件
"网址：http://vim.wikia.com/wiki/C++_code_completion
"
" 颜色
:hi Underlined ctermfg=3

" vimwiki
let g:vimwiki_list = [
\ {
\   'index' : 'vipwiki',
\   'path': '/data/vdj.com/wiki/', 
\   'path_html': '/data/vdj.com/vipwiki/',
\ }
\]
" 查找 :VimwikiSearch /pattern/  

:nmap <Leader>w <Plug>VimwikiIndex
:nmap <Leader>wi <Plug>VimwikiUISelect
:nmap <Leader>gt <Plug>VimwikiTabIndex
:nmap <Leader>wq <Plug>VimwikiSplitLink
:nmap <Leader>we <Plug>VimwikiVSplitLink
:nmap <Leader>wt <Plug>VimwikiTabnewLink
:nmap <Leader>wb <Plug>VimwikiGoBackLink
:nmap <Leader>wd <Plug>VimwikiDeleteLink
:nmap <leader>tt <Plug>VimwikiToggleListItem
:nmap <leader>wml <Plug>VimwikiTableMoveColumnLeft
:nmap <leader>wmr <Plug>VimwikiTableMoveColumnRight

" 日记
:nmap <Leader>di <Plug>VimwikiDiaryIndex
:nmap <Leader>d <Plug>VimwikiMakeDiaryNote
:nmap <Leader>dt <Plug>VimwikiTabMakeDiaryNote
:nmap <Leader>wcr <Plug>VimwikiDiaryGenerateLinks

" 转换html
:nmap <Leader>wc <Plug>Vimwiki2HTML
:nmap <Leader>wcc <Plug>VimwikiAll2HTML

:hi VimwikiHeader1 guifg=#FF0000
:hi VimwikiHeader2 guifg=#00FF00
:hi VimwikiHeader3 guifg=#0000FF
:hi VimwikiHeader4 guifg=#FF00FF
:hi VimwikiHeader5 guifg=#00FFFF
:hi VimwikiHeader6 guifg=#FFFF00

set path+=~/vip/,../../,../,../../protocol,../../common

" 表格 :VimwikiTable cols rows
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" 不进行语法检查
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
" 相对当前工作路径
let g:ycm_filepath_completion_use_working_dir = 1
