call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'folke/todo-comments.nvim'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdcommenter'
Plug 'yaegassy/coc-tailwindcss3'
Plug 'windwp/nvim-autopairs'
Plug 'jremmen/vim-ripgrep'
Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
call plug#end()
" lua require"bufferline".setup()
lua require("nvim-autopairs").setup {}
set tags=./tags,tags;/
set statusline+=%{gutentags#statusline()}
set mouse=a
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader=","
set shell=zsh
set number
nnoremap <Leader>m :b#<CR>
nnoremap <leader>x :NERDTreeToggle<CR>
nnoremap <Leader>f :tabnext<CR>
nnoremap <Leader>g :tabnew<CR>
nnoremap <Leader>, :w<CR>
nnoremap <Leader>q! :q<CR>
nnoremap <Leader>t :terminal<CR>
nnoremap <Leader>s :NERDTreeToggle<CR>
nnoremap <Leader>a :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>. :CtrlP<CR>
nnoremap <Leader>.. :CtrlPClearAllCaches<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <leader>q :q<cr>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>n :bNext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>dcu :!docker-compose up -d<CR>
nnoremap <leader>dcd :!docker-compose down<CR>
nnoremap <leader>dcl :!docker-compose logs -f<CR>
nnoremap <leader>cl :set colorcolumn=80<CR>
nnoremap <leader>ucl :set colorcolumn=0<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>pp :%!npx prettier --plugin=prettier-plugin-tailwindcss %<CR>
nmap <F8> :TagbarToggle<CR>
tnoremap <Esc> <C-\><C-n>

" Coc.nvim setup
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Run coc.runCommand on save
autocmd BufWritePre *.py call CocActionAsync('runCommand', 'ruff.executeFormat')
" autocmd BufWritePre * call CocAction('format')
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
" GoTo defintion of symbol in current document
nmap <leader>cd  <Plug>(coc-definition)

" Setup CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|build\|public\|vendor\|tmp\|log\|logs\|cache\|coverage\|\.git\|\.hg\|\.svn\|\.DS_Store\|\.gitignore\|\.gitmodules\|\.gitkeep\|\.hgignore\|\.hgsub\|\.hgsubstate\|\.svnignore\|.next\|.docusaurus'
let g:ctrlp_show_hidden = 1
" CTASG Support for TypescriptReact
let g:tagbar_type_typescriptreact = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
  \ 'c:class',
  \ 'n:namespace',
  \ 'f:function',
  \ 'G:generator',
  \ 'v:variable',
  \ 'm:method',
  \ 'p:property',
  \ 'i:interface',
  \ 'g:enum',
  \ 't:type',
  \ 'a:alias',
\ ],
\'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'n' : 'namespace',
  \ 'i' : 'interface',
  \ 'f' : 'function',
  \ 'G' : 'generator',
  \ 'm' : 'method',
  \ 'p' : 'property',
  \},
\ }
