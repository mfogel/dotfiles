syntax on
filetype plugin indent on

set visualbell t_vb=
set nu
set hls
colorscheme desert

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

set foldmethod=syntax
set foldlevel=99

" Make system clipboard and vim's the same
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed

" https://github.com/sheerun/prettier-standard#vim
let g:ale_fixers = {'javascript': ['prettier_standard'], 'css': ['prettier'], 'scss': ['prettier'], 'json': ['prettier']}
let g:ale_fix_on_save = 1
