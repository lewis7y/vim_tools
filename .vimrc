" ========================================   VIM 配置     =======================================
set nocompatible                                                "去掉vi的一致性 使用vim的键盘模式"
"set shortmess=atI                                              "不显示帮助乌干达的提示

" ======================================== vundle 环境设置 =======================================
filetype off
" set the runtime path to include Vundle and initialize
" 首先安装 Vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'Valloric/YouCompleteMe'                                             " 自动补全
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline', {'rtp': 'powerline/bindings/vim/'}         " Powerline状态栏
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'                                                 " git集成
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/indentpython.vim'                                       " python自动缩进
Plugin 'python-syntax/syntax'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'                                                 " 超级搜索
Plugin 'skammer/vim-css-color'
Plugin 'pangloss/vim-javascript'
Plugin 'isRuslan/vim-es6'
Plugin 'scrooloose/nerdtree'                                                " 文件树
Plugin 'scrooloose/syntastic'                                               " 语法检查
Plugin 'scrooloose/nerdcommenter'                                           " 多行注释
Plugin 'nvie/vim-flake8'                                                    " PEP8代码风格检查
Plugin 'joestelmach/lint.vim'
Plugin 'tmhedberg/SimpylFold'
Bundle 'davidhalter/jedi-vim'
Plugin 'Yggdroot/indentLine'                                                " 缩进指示线
" 配色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'yuttie/hydrangea-vim'                 " 紫色
Plugin 'liuchengxu/space-vim-theme'
Plugin 'whatyouhide/vim-gotham'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line

call vundle#end()                                                           " 插件列表结束
filetype plugin indent on


" YCM
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'                 " 默认配置文件路径
let g:ycm_confirm_extra_conf=0                                              " 打开vim时不再询问是否加载ycm_extra_conf.py配置
set completeopt=longest,menu
let g:ycm_server_python_interpreter='/usr/bin/python2.7'                    " python解释器路径
let g:ycm_seed_identifiers_with_syntax=1                                    " 是否开启语义补全"
let g:ycm_collect_identifiers_from_tags_files = 1                           " 开启 YCM 基于标签引擎
let g:ycm_complete_in_comments=1                                            " 是否在注释中也开启补全"
let g:ycm_complete_in_strings = 1                                           " 字符串中也开启补全"
let g:ycm_collect_identifiers_from_comments_and_strings = 0                 " 注释和字符串中的文字也会被收入补全
let g:ycm_min_num_of_chars_for_completion=2                                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_autoclose_preview_window_after_completion=1                       " 补全后自动关机预览窗口"
let g:ycm_add_preview_to_completeopt = 0                                    " 关闭函数原型提示
let g:ycm_cache_omnifunc=0                                                  " 禁止缓存匹配项,每次都重新生成匹配项"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif                     " 离开插入模式后自动关闭预览窗口"

" inoremap <expr> <CR> pumvisible() ? '<C-y>':'\<CR>'                       " 回车即选中当前项
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']                  " 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']                  " 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
" let g:ycm_key_invoke_completion = ['<C-Space>']                           " 主动补全, 默认为<C-Space>
" let g:ycm_key_list_stop_completion = ['<C-y>']                            " 停止显示补全列表, 可以按<C-Space>重新弹出
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>              " 转到定义 的快捷方式

let g:ycm_filetype_whitelist = { 
    \ "c":1,
    \ "cpp":1, 
    \ "objc":1,
    \ "sh":1,
    \ "zsh":1,
    \ "python":1,
    \ "lua":1,
    \ }


" NERDTree
nnoremap <silent> <F2> :NERDTree<CR>                                        " 映射以Ｆ2打开NERDTree
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1                                                 " 显示书签"
let NERDTreeIgnore=['\.pyc$', '\~$']                                        " ignore files in NERDTree
let NERDTreeWinSize=25                                                      " 窗口大小"
" 在目录树中显示 git 状态
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Yggdroot/indentLine
let g:indentLine_enabled = 1                                                " 开启展示
let g:indentLine_concealcursor = 'inc'                                      " 隐藏光标所在行的文本
let g:indentLine_conceallevel = 2                                           " 指定如何显示使用 
let g:indentLine_setColors = 0                                              " 恢复使用配色方案中的颜色
" let g:indentLine_color_term = 255                                         " 缩进线颜色
let g:indentLine_char='¦'                                                   " 缩进指示线
let g:indentLine_char_list = ['|', '¦', '┆', '┊']                           " 不同缩进层级


let g:NERDSpaceDelims=1                                                     " 注释的时候自动加个空格

" SimpylFold
let g:SimpylFold_docstring_preview=1                                        " 看到折叠代码中的描述

" vim-cpp-enhanced-highlight
let python_highlight_all = 1                                                " 打开python 全部语法高亮

"crtlP配置
"let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
map <C-p> :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" ========================================     显示相关     ========================================
set number                      " 显示行号"

" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b

" 隐藏顶部标签栏"
set showtabline=0
" 设置字体"
set guifont=Monaco:h13

" 设置主题颜色
let g:solarized_termcolors=256  " solarized主题设置在终端下的设置"
" set background=dark           " 设置背景色"
" colorscheme solarized
" colorscheme molokai
" colorscheme delek
" colorscheme zenburn
" colorscheme phd
" colorscheme hydrangea
" colorscheme space_vim_theme
" colorscheme railscasts        " 此主题在win cmd下可用
" colorscheme dracula

if has('gui_running')
    set background=light
    colorscheme dracula
else
    set background=dark
    colorscheme dracula
endif

call togglebg#map("<F12>")       " 切换主题功能(F12),轻色调/暗色调

syntax on                       " 开启语法高亮
syntax enable                   " 开启语法高亮

set nowrap                      " 设置不折行"
set showcmd                     " 输入的命令显示出来
set fileformat=unix             " 设置以unix的格式保存文件"

set cindent                     " 设置C样式的缩进格式"
set tabstop=4                   " 设置table长度"
set shiftwidth=4                " 同上"
set softtabstop=4
set autoindent                  " 开启自动缩进，保持缩进值与上一行相等
set smartindent                 " 智能缩进
set fileformat=unix             " 以unix格式储存文件

set showmatch                   " 显示匹配的括号"
set scrolloff=5                 " 距离顶部和底部5行"
set laststatus=2                " 命令行为两行(启动显示状态行)"
set backspace=2                 " 允许用退格键删除字符
"set backspace=indent,eol,start
set mouse=a                     " 启用鼠标"
set foldmethod=indent           " 启用代码折叠(根据每行的缩进开启折叠)
set foldlevel=99                " 折叠数？

"set selection=exclusive
"set selectmode=mouse,key
"set matchtime=5
set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 如果有一个大写字母，则切换到大小写敏感查找
set incsearch
set hlsearch                    " 高亮搜索项"
set noexpandtab                 " 不允许扩展table"
set whichwrap+=<,>,h,l
set autoread                    " 当文件在外部修改时，vim自动更新载入

" set novisualbell               " 不要闪烁
set cursorline                  " 突出显示当前行"
" set cursorcolumn               " 突出显示当前列"
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler                       " 显示当前光标行列位置(显示标尺，就是在右下角显示光标位置)

" 标示不必要的空白字符
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"被分割窗口之间显示空白
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/

" ========================================     编码设置     ========================================
set encoding=utf-8              " 字符编码
set fenc=utf-8                  " 文件编码
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936,big-5
set enc=utf-8
let &termencoding=&encoding
set clipboard=unnamed           "共享系统剪切板

" ========================================    自定义键映射   ========================================
"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>

" 实现CTRL-w保存操作
nnoremap <C-w> :w<cr>
imap <C-w> <Esc>:w<cr>i

"映射自动补全括号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i

" 分割窗口切换快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" =========================================   不同语言设置   ==========================================
" 支持Virtualenv虚拟环境
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
