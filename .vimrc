call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/neodev.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-jest'
Plug 'nvim-telescope/telescope.nvim', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdcommenter'
Plug 'yaegassy/coc-tailwindcss3'
Plug 'jremmen/vim-ripgrep'
Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/tagbar'
Plug 'ruanyl/vim-sort-imports'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'LiadOz/nvim-dap-repl-highlights'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'David-Kunz/jester'
Plug 'navarasu/onedark.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jay-babu/mason-nvim-dap.nvim'
call plug#end()
set clipboard=unnamedplus
set tags=./tags,tags;/
set mouse=a
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader=","
set shell=zsh
colorscheme onedark
nnoremap <Leader>m :b#<CR>
nnoremap <leader>x :bufdo bd<CR>
nnoremap <Leader>f :tabnext<CR>
nnoremap <Leader>g :tabnew<CR>
nnoremap <Leader>, :w<CR>
nnoremap <Leader>q! :q<CR>
nnoremap <Leader>t :terminal<CR>
nnoremap <Leader>s :NERDTreeToggle<CR>
nnoremap <Leader>a :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>e :lua require"jester".debug_file()<CR>
nnoremap <Leader>. :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>l :lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <Leader>u :lua require("dapui").toggle()<CR>
nnoremap <Leader>nt :lua require("neotest").run.run({strategy = "dap"})<CR>
nnoremap <Leader>nx :lua require("neotest").run.run()<CR>
nnoremap <Leader>na :lua require("neotest").run.attach()<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <leader>q :q<cr>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>n :bNext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>dcu :!docker-compose up -d<CR>
nnoremap <leader>dcb :!docker-compose up -d --build<CR>
nnoremap <leader>dcd :!docker-compose down<CR>
nnoremap <leader>dcl :!docker-compose logs -f<CR>
nnoremap <leader>cl :set colorcolumn=80<CR>
nnoremap <leader>ucl :set colorcolumn=0<CR>
nnoremap <leader>nnn :set nonumber<CR>
nnoremap <leader>nn :set number<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>pp :%!npx prettier --plugin=prettier-plugin-tailwindcss %<CR>
nmap <F10> :TagbarToggle<CR>
tnoremap <Esc> <C-\><C-n>

" Setup nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F9> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_out()<CR>
nnoremap <silent> <F8> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <F2> :lua require'dap'.repl.open()<CR>
nnoremap <silent> <F4> :lua require'dap'.run_last()<CR>

au FileType dap-repl lua require('dap.ext.autocompl').attach()
" Setup lua-line, mason and blankline
lua << END
require('lualine').setup()
require("ibl").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()
require("neodev").setup({})
require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "npx jest --watch ",
    }),
  }
})
END

" Setup Dap and Dap-Vscode-JS
lua << EOF
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

require("dap-vscode-js").setup({
  node_path = "/root/.nvm/versions/node/v20.9.0/bin/node",
  debugger_path = "/root/vscode-js-debug",
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})
require('nvim-dap-repl-highlights').setup()
for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      address = "0.0.0.0",
      port = 9229,
      processId = require'dap.utils'.pick_process,
      skipFiles = { "<node_internals>/**" },
      continueOnAttach = true,
    }
  }
end
EOF
" Setup telescope-dap
lua << EOF
require('telescope').load_extension('dap')
EOF

" Setup coc-ruff
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
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

" Setup Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

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
\}
