" --- Basics ---
set nocompatible
let mapleader = " "

filetype plugin indent on
syntax on

" --- General Quality of Life ---
set number
set mouse=a
set clipboard=unnamedplus
set backspace=indent,eol,start
set wildmenu
set showcmd
set laststatus=2
set noshowmode

" --- Search Settings ---
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>

" --- Indentation & Tabs ---
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" --- Hybrid Line Numbers ---
set relativenumber

" --- Visualizing Hidden Traps ---
set list
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«

" --- Structural Navigation & Context ---
set cursorline
set scrolloff=7
set wrap
set linebreak

" --- Better Navigation ---
nnoremap j gj
nnoremap k gk

" --- Undo breaks on punctuation ---
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" --- Centralize backup and swap file ---
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

" --- YAML ---
autocmd FileType yaml,yml setlocal ts=2 sw=2

" --- Auto-create missing directories ---
augroup BW_AutoCreateDir
  autocmd!
  autocmd BufWritePre * if expand("<afile>") !~ '://' | call mkdir(expand("<afile>:p:h"), "p") | endif
augroup END

" --- Statusline Customization ---
let &statusline = '%#StatusLineMode# %{StatuslineMode()} '
let &statusline .= '%#StatusLineFile# %f '
let &statusline .= '%#StatusLineModified#%m'
let &statusline .= '%='
let &statusline .= '%#StatusLineFormat# %y '
let &statusline .= '%#StatusLineFormat# %{&ff} '
let &statusline .= '%#StatusLinePos# %l/%L :%c '
let &statusline .= ' %p%% '

function! StatuslineMode()
    let l:mode = mode()
    if l:mode==#"n"  | return "NORMAL" | endif
    if l:mode==#"i"  | return "INSERT" | endif
    if l:mode==#"v"  | return "VISUAL" | endif
    if l:mode==#"V"  | return "V-LINE" | endif
    if l:mode==#"\<C-v>" | return "V-BLOCK" | endif
    if l:mode==#"R"  | return "REPLACE" | endif
    if l:mode==#"c"  | return "COMMAND" | endif
    return l:mode
endfunction

highlight StatusLineMode      ctermfg=0 ctermbg=4 guifg=#000000 guibg=#6699cc
highlight StatusLineFile      ctermfg=7 ctermbg=8 guifg=#ffffff guibg=#333333
highlight StatusLineModified   ctermfg=1 ctermbg=8 guifg=#ff3333 guibg=#333333
highlight StatusLineFormat    ctermfg=7 ctermbg=8 guifg=#cccccc guibg=#333333
highlight StatusLinePos       ctermfg=0 ctermbg=7 guifg=#000000 guibg=#cccccc

" --- Prose Utilities ---
set spelllang=en_gb
set dictionary=/usr/share/dict/words
set complete+=kspell
nnoremap <leader>s :set spell!<CR>

function! s:EnableProseMode() abort
  setlocal spell
  setlocal wrap
  setlocal linebreak
  setlocal nolist
  setlocal textwidth=80
  setlocal formatoptions+=t
endfunction

function! s:DisableProseMode() abort
  setlocal nospell
  setlocal wrap
  setlocal linebreak
  setlocal list
  setlocal textwidth=0
  setlocal formatoptions-=t
endfunction

augroup ProseWriting
  autocmd!
  autocmd BufRead,BufNewFile *.md,*.markdown setfiletype markdown
  autocmd BufRead,BufNewFile *.txt setfiletype text
  autocmd FileType markdown,text call s:EnableProseMode()
  autocmd BufWinLeave *.md,*.markdown,*.txt call s:DisableProseMode()
augroup END

" --- Vimwiki Settings ---
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ }]

let g:vimwiki_global_ext = 0
nnoremap <leader>f :Files ~/vimwiki<CR>
nnoremap <leader>g :Rg<CR>
