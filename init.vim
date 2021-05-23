set hidden
set number

" spaces, not tabs
set expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" use system clipboard (:help clipboard)
set clipboard+=unnamedplus

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
Plug 'HerringtonDarkholme/yats.vim', {'commit': '6104b30'}
Plug 'jparise/vim-graphql', {'tag': 'v1.3'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lepture/vim-velocity', {'commit': 'a494e9e', 'for': 'velocity'}
Plug 'maxmellon/vim-jsx-pretty', {'commit': '6989f16'}
Plug 'numirias/semshi', {'commit': '801d0c9', 'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'pangloss/vim-javascript', {'commit': '3c90d0c', 'for': 'javascript'}
Plug 'preservim/nerdtree', {'commit': '577ddc7'}
Plug 'Soares/base16.nvim', {'commit': '340e914'}
Plug 'tpope/vim-vinegar', {'commit': '5fee9d2'}
Plug 'vim-airline/vim-airline', {'commit': 'aa773f5'}
Plug 'vim-airline/vim-airline-themes', {'commit': 'e1b0d9f'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'commit': '85c4bed'}
Plug 'Yggdroot/indentLine', {'commit': '1cbd532'}
call plug#end()

" https://github.com/Yggdroot/indentLine/issues/140#issuecomment-624662832
let g:vim_json_syntax_conceal = 0

" https://github.com/preservim/nerdtree/issues/913#issuecomment-450468257
let g:indentLine_fileTypeExclude = ["nerdtree"]

" Ale configuration https://github.com/w0rp/ale/blob/master/doc/ale.txt
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_lint_on_text_changed = 0
" prettier language support: https://prettier.io/docs/en/
let g:ale_fixers = {
      \   'css': ['prettier'],
      \   'graphql': ['prettier'],
      \   'html': ['prettier'],
      \   'javascript': ['prettier'],
      \   'json': ['prettier'],
      \   'less': ['prettier'],
      \   'markdown': ['prettier'],
      \   'python': ['black', 'isort'],
      \   'scss': ['prettier'],
      \   'typescript': ['prettier'],
      \   'vue': ['prettier'],
      \   'yaml': ['prettier']
      \ }
let g:ale_fix_on_save = 1

" vim-airline configuration
" https://github.com/dense-analysis/ale#5vii-how-can-i-show-errors-or-warnings-in-my-statusline
let g:airline_statusline_ontop=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" nerd tree
let g:NERDTreeWinSize=32

" Open sign column immediatlely at startup. Without this there's an annoying delay.
" Initialize its colors like Ale will. The 'colorscheme' command must have completed
" before this runs to avoid an annoying grey flash.
set signcolumn:yes
highlight clear SignColumn

" https://github.com/Soares/base16.nvim
set termguicolors
colorscheme tomorrow
let g:airline_theme='base16_tomorrow'
