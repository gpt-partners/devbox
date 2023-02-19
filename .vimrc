call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'chriskempson/tomorrow-theme', {'dir': '~/.config/nvim/colors', 'rtp': 'vim'}
call plug#end()
colorscheme Tomorrow-Night-Bright
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader = ","
set shell=zsh
nnoremap <Leader>m :b#<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>, :w<CR>
nnoremap <Leader>q! :q<CR>
nnoremap <Leader>. :CtrlP<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <leader>q :q<cr>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>n :bNext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
tnoremap <Esc> <C-\><C-n>
