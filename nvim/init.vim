" show line numbers
set number
set numberwidth=3

" spaces, not tabs
set expandtab shiftwidth=2 tabstop=2

" spacebar leader
let mapleader=" "

" treat geojson files as json
au BufNewFile,BufRead *.geojson setfiletype json

" use system keyboard
set clipboard+=unnamedplus

""""""""""""""" Vim Plug plugins begin """"""""""""""""""""
" https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" syntax highlighting, indenting, folding
" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'tag': 'v0.8.0'}

" LSP ecosystem
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82'}

" Colors
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox', {'commit': 'bf2885a'}

" Status line
" https://github.com/nvim-lualine/lualine.nvim
Plug 'nvim-lualine/lualine.nvim', {'commit': 'fffbcb8'}
Plug 'kyazdani42/nvim-web-devicons', {'commit': '05e1072'}

" Helpful mappings
Plug 'tpope/vim-unimpaired', {'tag': 'v2.1'}

call plug#end()
""""""""""""""" Vim Plug plugins end """"""""""""""""""""

" CoC extensions
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extension
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-eslint',
  \'coc-git',
  \'coc-go',
  \'coc-html',
  \'coc-json',
  \'coc-markdownlint',
  \'coc-prettier',
  \'coc-pyright',
  \'coc-toml',
  \'coc-tsserver',
  \'coc-yaml'
  \]

""""""""""""""" CoC config begin """"""""""""""""""""
" https://github.com/neoclide/coc.nvim#example-vim-configuration
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" python files: sort imports using isort before saving
" https://github.com/fannheyward/coc-pyright/issues/489#issuecomment-845709431
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

""""""""""""""" CoC config end """"""""""""""""""""

""""""""""""""" Markdown optimized for note-taking begin """"""""""""""""""""

" markdown at 80 chars for good note-taking, everything else at 120
" https://gitter.im/neoclide/coc.nvim?at=5f131f3582ccdc78add05802
autocmd BufEnter *.md call coc#config('prettier.printWidth', 80)
autocmd BufLeave *.md call coc#config('prettier.printWidth', 120)

autocmd BufEnter *.md set signcolumn=no
autocmd BufLeave *.md set signcolumn=yes

autocmd BufEnter *.md set spell
autocmd BufLeave *.md set spell!

""""""""""""""" Markdown optimized for note-taking end """"""""""""""""""""

" configure lualine
" Requires a font patched with glyphs
" https://github.com/ryanoasis/nerd-fonts
" https://github.com/Karmenzind/monaco-nerd-fonts
lua << END
require('lualine').setup {
  sections = {
    lualine_c = {'b:coc_git_blame'},
    lualine_x = {'filename', 'encoding', 'fileformat', 'filetype'},
  }
}
END

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
