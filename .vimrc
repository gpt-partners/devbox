call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/bufferline.nvim'
Plug 'kien/ctrlp.vim'
Plug 'chriskempson/tomorrow-theme', {'dir': '~/.config/nvim/colors', 'rtp': 'vim'}
Plug 'preservim/nerdtree'
Plug 'metakirby5/codi.vim'
Plug 'folke/todo-comments.nvim'
"Plug 'mattn/emmet-vim'
call plug#end()
colorscheme Tomorrow-Night-Bright
lua require"bufferline".setup({
  seperator_style = "table"
})
set mouse=a
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader=","
let AirlineTheme=light
set shell=zsh
nnoremap <Leader>m :b#<CR>
nnoremap <Leader>f :tabnext<CR>
nnoremap <Leader>g :tabnew<CR>
nnoremap <Leader>, :w<CR>
nnoremap <Leader>q! :q<CR>
nnoremap <Leader>s :NERDTreeToggle<CR>
nnoremap <Leader>a :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>. :CtrlP<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <leader>q :q<cr>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>n :bNext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>p :PlugInstall<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
tnoremap <Esc> <C-\><C-n>
