set tabstop=4 softtabstop=4
set shiftwidth=4 expandtab 
set relativenumber 
set nu 
set noerrorbells
set nowrap
set noswapfile
set nobackup
set ignorecase smartcase
set scrolloff=8
set incsearch
set colorcolumn=80
set signcolumn=yes
hi ColorColumn ctermbg=darkgrey guibg=darkgrey 

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'jmckiern/vim-venter'
call plug#end()

colorscheme gruvbox

lua require'rust-tools'.setup{ server={on_attach=require'completion'.on_attach}}

set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_character = ['.', '::']
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <leader>c :!cargo clippy
