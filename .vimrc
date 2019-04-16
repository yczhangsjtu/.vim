syntax on
set number
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set foldlevelstart=0
set hlsearch
set incsearch
set expandtab

filetype plugin on

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
endif

nnoremap <up> gk
nnoremap <down> gj

inoremap ;; <esc>
inoremap <esc> <nop>
vnoremap ;; <esc>
vnoremap <esc> <nop>

let mapleader = " "
noremap - ddp
inoremap <c-u> <esc>viwUA
nnoremap <c-u> viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

