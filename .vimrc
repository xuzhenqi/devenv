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
set mouse=a
set showmatch
set hlsearch
set matchtime=1
set smartindent
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=3
set backspace=indent,eol,start
" 80 characters visualization
" set textwidth=80
set cc=81,82
hi ColorColumn ctermbg=darkgrey guibg=lightgrey
" }}}

" Common Scripts {{{
au FileType c,cpp inoremap crrr /* Copyright(c). All Rights Reserved<cr>Author: Xu Zhenqi<cr>Email: xuzhenqi@bytedance.com<cr>/<cr>
au FileType python nnoremap <leader>de Iimport ipdb; ipdb.set_trace()<cr><esc> 
" }}}

" Cuda Related {{{
au BufNewFile,BufRead *.cu set filetype=cuda
au BufNewFile,BufRead *.cuh set filetype=cuda
" }}}

" pathogen {{{
execute pathogen#infect()
" }}}

" autopairs {{{
" let g:AutoPairsShortcutToggle='π' " <M-p>
" let g:AutoPairsShortcutFastWrap='´' " <M-e>
" let g:AutoParisShortcutJump='˜' " <M-n>
" let g:AutoPairsFlyMode=1
" let g:AutoPairsShortcutBackInsert='∫' " <M-b>
" }}}

" nerdtree {{{
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
" R : refresh root folder
" <M-n> to toggle NERDTree
nnoremap <leader>ne :NERDTreeToggle<CR> 
" close vim if NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}} 

" minibufexplorer {{{
let g:miniBufExplMaxSize = 2
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = ".ycm_extra_conf.py" 
let g:ycm_confirm_extra_conf = 0 
" default path: ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
" nnoremap <C-[> :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" unmap <ESC>
" YCM GoTo works bad, using tags instead
set completeopt=longest,menu 
let g:ycm_python_binary_path = 'python'
nnoremap <C-5> :YcmForceCompileAndDiagnostics<CR>
nnoremap yf :YcmCompleter FixIt<CR>
let g:ycm_always_populate_location_list = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif " 离开插入模式后自动关闭预览窗口
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

" Taglist {{{
nnoremap <leader>t :TlistToggle<cr>
nnoremap <C-[> :ts<cr>
" ctags -R --c++-kinds=+p --fields=+isS --extra=+q .
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Auto_Open = 1
" }}}

" IndentLine {{{
let g:indentLine_enabled = 0
nnoremap <leader>il :IndentLinesToggle<cr>
let g:indentLine_char = '.'
let g:indentLine_color_term = 120
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_color_gui = '#A4E57E'
" }}}

" vim-comentary {{{
autocmd FileType cmake setlocal cms=#\ %s
autocmd FileType c,cpp,cuda setlocal cms=//\ %s 
" }}}

" vim-flake8 {{{
autocmd FileType python map <buffer> <leader>fl :call Flake8()<CR>
let g:flake8_show_in_file=1
" autocmd BufWritePost *.py call Flake8()
" }}}

" proto syntax {{{
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
  au! BufRead,BufNewFile *.prototxt setfiletype proto
augroup end
" }}}
