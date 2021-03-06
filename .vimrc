" Common Setting {{{
set nu
syntax on
autocmd InsertLeave * se cul
autocmd InsertEnter * se cul 
set showcmd 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=1 
set nocompatible 
colorscheme desert 
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

let mapleader = ","
nnoremap <leader>q :q<cr>:q<cr>:q<cr>:q<cr>
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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}} 

" minibufexplorer {{{
let g:miniBufExplMaxSize = 2
" }}}

" let g:loaded_youcompleteme = 0
let g:ycm_global_ycm_extra_conf = ".ycm_extra_conf.py" 
let g:ycm_confirm_extra_conf = 0 
" default path: ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
nnoremap <C-p> :YcmCompleter GoToDefinition<CR> 
nnoremap <C-o> :YcmCompleter GoToDeclaration<CR>
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
nnoremap <leader>ev :vsplit ${DEV_HOME}/development/devenv/.vimrc<cr>
nnoremap <leader>sv :source ${DEV_HOME}/development/devenv/.vimrc<cr> 
" }}}

" Vimcript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker 
augroup END
" }}}

" Taglist {{{
" let Tlist_Ctags_Cmd = '$DEV_HOME/local/bin/ctags'
nnoremap <leader>t :TlistToggle<cr>
nnoremap <C-[> :ts<cr>
" ctags -R --c++-kinds=+p --fields=+isS --extra=+q .
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
" let Tlist_Auto_Open = 1
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

" vim-pylint {{{
" function! Pylint()
"     silent make
"     redraw!
"     botright copen 5
" endfunction
" autocmd FileType python set makeprg=pylint\ --disable=missing-docstring,broad-except\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %\ 2>/dev/null
" autocmd FileType python set makeprg=pylint\ %:p 
" autocmd FileType python map <leader>fl :call Pylint()<CR>
" }}} 


" vim-cpplint {{{
function! Cpplint()
    silent make
    redraw!
    botright copen 5
endfunction
autocmd FileType c,cpp setlocal makeprg=cpplint\ --filter=-build/c++11\ --root=src\ %\ 2>&1
autocmd FileType c,cpp map <leader>fl :call Cpplint()<CR>
" }}} 

" proto syntax {{{
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
  au! BufRead,BufNewFile *.prototxt setfiletype proto
augroup end
" }}}

" python init {{{
function! ScriptInit()
    let line = -1
    let line += 1 | call append(line, "#!/usr/bin/env python")
    let line += 1 | call append(line, "# -*- coding: utf-8 -*-")
    let line += 1 | call append(line, "import logging")
    let line += 1 | call append(line, "import sys")
    let line += 1 | call append(line, "import argparse")
    let line += 1 | call append(line, "")
    let line += 1 | call append(line, "")
    let line += 1 | call append(line, "def check_args(a):")
    let line += 1 | call append(line, "    pass")
    let line += 1 | call append(line, "")
    let line += 1 | call append(line, "")
    let line += 1 | call append(line, "def init():")
    let line += 1 | call append(line, "    logging.basicConfig(")
    let line += 1 | call append(line, "        level=logging.INFO,")
    let line += 1 | call append(line, "        stream=sys.stdout,")
    let line += 1 | call append(line, "        format='%(asctime)-15s [%(levelname)s] %(message)s')")
    let line += 1 | call append(line, "    p = argparse.ArgumentParser(")
    let line += 1 | call append(line, "        description='',")
    let line += 1 | call append(line, "        formatter_class=argparse.ArgumentDefaultsHelpFormatter)")
    let line += 1 | call append(line, "    a = p.parse_args()")
    let line += 1 | call append(line, "    check_args(a)")
    let line += 1 | call append(line, "    return a")
    let line += 1 | call append(line, "")
    let line += 1 | call append(line, "")
    let line += 1 | call append(line, "if __name__ == '__main__':")
    let line += 1 | call append(line, "    a = init()")
endfunction
autocmd FileType python nnoremap <leader>si :call ScriptInit()<cr>
" }}}

" shell init {{{
function! ScriptInitShell()
    let line = -1
    let line += 1 | call append(line, "#!/usr/bin/env bash")
    let line += 1 | call append(line, "# -*- coding: utf-8 -*-")
endfunction
autocmd FileType sh nnoremap <leader>si :call ScriptInitShell()<cr>
" }}}
