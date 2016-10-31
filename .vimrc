" Common Setting {{{
set nu
syntax on
autocmd InsertLeave * se cul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul  " 用浅色高亮当前行  
set showcmd         " 输入的命令显示出来，看的清楚些  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" colorscheme murphy " 设置配色方案
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set clipboard+=unnamed " 共享剪切板
filetype plugin indent on
" }}}

" pathogen {{{
execute pathogen#infect()
" }}}

" autopairs {{{
let g:AutoPairsShortcutToggle='π' " <M-p>
" let g:AutoPairsShortcutFastWrap='´' " <M-e>
" let g:AutoParisShortcutJump='˜' " <M-n>
let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutBackInsert='∫' " <M-b>
" }}}

" nerdtree {{{
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
" <M-n> to toggle NERDTree
map ˜ :NERDTreeToggle<CR> 
" close vim if NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}} 

" minibufexplorer {{{
let g:miniBufExplMaxSize = 2
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = ".ycm_extra_conf.py" 
" default path: ~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py
nnoremap <C-[> :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu 
let g:ycm_python_binary_path = 'python'
nnoremap <C-5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_always_populate_location_list = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif " 离开插入模式后自动关闭预览窗口
unmap <ESC>
" }}}

" Editing VIMRC {{{
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 
" }}}

" Vimcript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker 
augroup END
" }}}
