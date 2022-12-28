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
Plug 'nvim-treesitter/nvim-treesitter', {'tag': 'v0.8.0', 'do': ':TSUpdate'}

" LSP ecosystem
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82'}

" Colors
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox', {'commit': 'bf2885a'}

" Status line
" https://github.com/nvim-lualine/lualine.nvim
Plug 'nvim-lualine/lualine.nvim', {'commit': '32a7382'}
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
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""" CoC config end """"""""""""""""""""

" python files: sort imports using isort before saving
" https://github.com/fannheyward/coc-pyright/issues/489#issuecomment-845709431
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

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
