colorscheme codedark
let g:NERDTreeHijackNetrw = 0
packadd startify
packadd tree
packadd zen
packadd nvim-lspconfig
lua require("lsp")

"let g:polyglot_disabled = ['markdown']
"packadd vim-css-color
"packadd vim-jsx-typescript
"packadd vim-pandoc-syntax
"packadd vim-pandoc
"packadd vim-polyglot
"packadd csv.vim
"packadd jupytext.vim
"packadd vim-auto-save
"packadd vimmu
"packadd vim-mathpix
"packadd noffice

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

"noremap <leader>m :MailBoxes<cr>
"noremap <leader><F1> :call IterDirPrev()<cr>
"noremap <leader><F2> :call IterDirNext()<cr>
noremap <F3> :sp <bar> term <cr>
noremap <F4> :vsp <bar> term <cr>
nmap <F5> :echom "No function" <cr>
nmap <F6> :echom "No function" <cr>
nmap <F7> :echom "No function" <cr>
nmap <F8> :setl spell!<cr>
nmap <F9> :!pcmanfm & disown<cr>
nnoremap <F11> :Goyo<cr>
" F12 Maps
nmap <F12> :sp $MYVIMRC <cr>
nmap <C-f> :NERDTreeToggle<cr>
"nnoremap <C-t> :tabnew<CR>
"nnoremap <S-C-TAB> :tabprevious<CR>
"nnoremap <C-TAB>   :tabnext<CR>

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
"let g:node_host_prog = '/usr/bin/neovim-node-host'
" Setting up the menu
" source ~/.config/nvim/menu.vim
" pip install pylsp
