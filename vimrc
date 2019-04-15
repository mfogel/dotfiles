syntax on
filetype plugin indent on

set visualbell t_vb=
set nu
set hls
set showtabline=2

" desert colorscheme, extended a bit so the SignColumn matches well
" https://github.com/fugalh/desert.vim
colorscheme desert
highlight SignColumn guibg=grey20 ctermbg=black

" https://stackoverflow.com/a/15317146/103909
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" https://stackoverflow.com/a/1878983/103909
" https://stackoverflow.com/a/159066/103909
set shiftwidth=2 tabstop=2 softtabstop=0 expandtab smarttab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" https://github.com/w0rp/ale#5iv-how-can-i-show-errors-or-warnings-in-my-statusline
let g:airline#extensions#ale#enabled = 1

" Ale configuration
" https://github.com/w0rp/ale/blob/master/doc/ale.txt
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_lint_on_text_changed = 0

" open sign column right at startup. Without this there's an annoying delay
set scl:yes

set foldmethod=syntax
set foldlevel=99

" Make system clipboard and vim's the same
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed

" https://github.com/sheerun/prettier-standard#vim
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'vue': ['prettier']
\ }
let g:ale_fix_on_save = 1

" treat geojson files as json
au BufNewFile,BufRead *.geojson set filetype=json

" treat Jakefiles as javascript
au BufNewFile,BufRead Jakefile set filetype=javascript

" recognize vue files
au BufNewFile,BufRead *.vue set filetype=vue

" https://support.apple.com/en-us/HT201749
" http://www.levien.com/type/myfonts/inconsolata.html
set guifont=Inconsolata\ Regular:h14
set guioptions-=rL
set linespace=2
