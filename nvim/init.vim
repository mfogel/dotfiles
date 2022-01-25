" show line numbers
set number
set numberwidth=3

" spaces, not tabs
set expandtab shiftwidth=2 tabstop=2

""""""""""""""" Vim Plug plugins begin """"""""""""""""""""
" https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" syntax highlighting, indenting, folding
" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'commit': 'f9179db'}

" LSP ecosystem
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'commit': '5b8cc58'}

" Colors
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox', {'commit': 'bf2885a'}

call plug#end()
""""""""""""""" Vim Plug plugins end """"""""""""""""""""

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extension
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-git',
  \'coc-html',
  \'coc-json',
  \'coc-markdownlint',
  \'coc-toml',
  \'coc-yaml'
  \]

" configure tree-sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=20

" A colorscheme that works well with coc out-of the box
" https://github.com/neoclide/coc.nvim/wiki/F.A.Q#bad-background-highlight-of-floating-window
" https://github.com/morhetz/gruvbox
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
