colorscheme codedark
let g:NERDTreeHijackNetrw = 0
packadd startify
packadd tree
packadd zen
packadd nvim-lspconfig
lua require("lsp")

set nocompatible
set termguicolors
set mouse=nv
filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set noacd
set exrc
set clipboard+=unnamedplus
set splitbelow
set splitright

noremap <F3> :sp <bar> term <cr>
noremap <F4> :vsp <bar> term <cr>
nmap <F5> :echom "No function" <cr>
nmap <F6> :echom "No function" <cr>
nmap <F7> :echom "No function" <cr>
nmap <F8> :setl spell!<cr>
nmap <F9> :!pcmanfm & disown<cr>
nnoremap <F11> :Goyo<cr>
nmap <F12> :sp $MYVIMRC <cr>
nmap <C-f> :NERDTreeToggle<cr>

autocmd TermOpen * silent setlocal nonumber nowrap

ia \? ¿
ia \! !
ia \"u ü
ia \'e é
ia \'a á
ia \'i í
ia \'o ó
ia \'u ú
ia \~n ñ
ia \~N Ñ

let g:loaded_python_provider=0
let g:loaded_ruby_provider=0
let g:loaded_node=0
let g:python3_host_prog = '/usr/bin/python3'
