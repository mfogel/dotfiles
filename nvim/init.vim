colorscheme elflord
set number

" spaces, not tabs
set expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" copy-paste from system clipboard
let mapleader = "\<Space>"
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" treat geojson files as json
au BufNewFile,BufRead *.geojson setfiletype json

" Treat javascript-like files as javascript
" https://github.com/pangloss/vim-javascript/blob/3c90d0c/ftdetect/javascript.vim
autocmd BufNewFile,BufRead *.{js,mjs,cjs,jsm,es,es6},Jakefile setfiletype javascript

" Get vim-velocity to work
au BufNewFile,BufRead *.vtl setfiletype velocity

" https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'dense-analysis/ale', {'tag': 'v3.0.0'}
Plug 'elzr/vim-json', {'commit': '3727f08', 'for': 'json'}
Plug 'jparise/vim-graphql', {'tag': 'v1.3'}
Plug 'lepture/vim-velocity', {'commit': 'a494e9e', 'for': 'velocity'}
Plug 'numirias/semshi', {'commit': '801d0c9', 'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'pangloss/vim-javascript', {'commit': '3c90d0c', 'for': 'javascript'}
Plug 'vim-airline/vim-airline', {'commit': 'aa773f5'}
Plug 'Yggdroot/indentLine', {'commit': '1cbd532'}
call plug#end()

" https://github.com/Yggdroot/indentLine/issues/140#issuecomment-624662832
let g:vim_json_syntax_conceal = 0

" Ale configuration https://github.com/w0rp/ale/blob/master/doc/ale.txt
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_lint_on_text_changed = 0
let g:ale_fixers = {
      \   'python': ['black', 'isort'],
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier'],
      \   'css': ['prettier'],
      \   'scss': ['prettier'],
      \   'json': ['prettier'],
      \   'vue': ['prettier']
      \ }
let g:ale_fix_on_save = 1

" https://github.com/dense-analysis/ale#5vii-how-can-i-show-errors-or-warnings-in-my-statusline
let g:airline#extensions#ale#enabled = 1

" Open sign column immediatlely at startup. Without this there's an annoying delay.
" Initialize its colors like Ale will. The 'colorscheme' command must have completed
" before this runs to avoid an annoying grey flash.
set signcolumn:yes
highlight clear SignColumn
