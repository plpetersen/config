set clipboard+=unnamedplus
set scrolloff=3

" map ;; to Esc so that we can exit insert mode easily 
map! ;; <Esc>

" always respect word wrapping when navigating up/down
" v:count is to ignore this on #+<move key> expressions
" noremap <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <expr> k (v:count == 0 ? 'gk' : 'k')
noremap j gj
noremap k gk

" support control + backspace/del functionality of non-vim editors
inoremap <C-h> <C-w>
inoremap <C-del> <cmd>norm! dw<CR>
nnoremap <C-h> <space>db
nnoremap <C-del> daw

" move normally by using Alt (formerly Ctrl)
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <Ak> <Up>
inoremap <A-l> <Right>
" Don't need these for command mode honestly
"cnoremap <C-h> <Left>
"cnoremap <C-j> <Down>
"cnoremap <C-k> <Up>
"cnoremap <C-l> <Right>


