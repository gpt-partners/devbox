call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/bufferline.nvim'
Plug 'kien/ctrlp.vim'
Plug 'chriskempson/tomorrow-theme', {'dir': '~/.config/nvim/colors', 'rtp': 'vim'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdcommenter'
Plug 'yaegassy/coc-tailwindcss3'
Plug 'windwp/nvim-autopairs'
call plug#end()
colorscheme Tomorrow-Night-Bright
lua << EOF
require("bufferline").setup{}
EOF
set mouse=a
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader=","
let AirlineTheme='light'
set shell=zsh
nnoremap <Leader>m :b#<CR>
nnoremap <Leader>f :tabnext<CR>
nnoremap <Leader>g :tabnew<CR>
nnoremap <leader>x :NERDTreeToggle<CR>
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

" Coc.nvim setup
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" GoTo code navigation
nmap <silent> cd <Plug>(coc-definition)
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)
" Configure neoformat
" Format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
" Setup CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Configure autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF
