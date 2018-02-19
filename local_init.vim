" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_rubocop_args = '--config .rubocop_todo.yml'
" Remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
let g:indentLine_leadingSpaceEnabled = 1

augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" nnoremap <Leader>sc :SyntasticCheck<CR>
" nnoremap <Leader>sr :SyntasticReset<CR>
nnoremap <Leader>nm :Neomake<CR>
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

set number relativenumber
let Grep_Skip_Dirs .= ' screens public/packs-test public/packs'
let Grep_Default_Options = '-IR --ignore-case'


let g:neomake_ruby_rubocop_args = '--config .rubocop_todo.yml'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
call neomake#configure#automake('nw', 750)

set lazyredraw

" Raw Ag command
command! -bang -nargs=* Rag
  \ call fzf#vim#ag_raw(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" call fzf#vim#ag_raw('accessible_sub_accounts -G .rb')
