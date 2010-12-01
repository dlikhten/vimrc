set nocompatible

source $VIMRUNTIME/mswin.vim
behave mswin

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set number
set vb t_vb=
set ts=4 sts=4 sw=4 expandtab
colorscheme ir_black
set smartcase

" Makes filetype specific indentation and plugins work properly
" (why this isn't on by default I have no idea).
filetype plugin indent on

" Turn syntax colouring on (is on by default on some systems but not others)
syntax on

" Turn on spell checking (don't worry, it only spell checks your comments, not your code :))
set spell

" Break long lines at nice places like word boundaries, rather than the last character that fits
set linebreak

" Make disambiguation in tab completion for filenames (for :e, etc.) work sensibly (more bash-like)
set wildmode=list:longest,full

" Ignore object files when tab-completing filenames
" (this is for C and Java; users of other languages can change as they see fit)
set wildignore=*.o,*.class

" Always show the mode and command on the status line
" (again, some systems do this by default but not others)
set showmode 
set showcmd

" Make searching case insensitive (unless pattern contains upper case chars) and incremental, and don't highlight matches
set nohlsearch ignorecase incsearch smartcase



" show tabs and newlines in subtle gray, toggle display with \w
set list
set listchars=tab:»\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
nmap <leader>w :set list!

" transpose
nmap <C-T> hxp

" find window
nmap <C-f> :promptrepl<CR>

" expected tabbing behavior
nmap <C-t> :tabnew<CR>
nmap <C-w> :tabclose<CR>
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>

" Open files relative to current directory of the current file.
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :cd %:p:h<cr>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e 
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" fast editing of vimrc
map <Leader>e :tabe $MYVIMRC<cr>

" ,v  select inserted text
nnoremap <Leader>i V`]

" ,a  yank all text from buffer 
nnoremap <Leader>a :%y<cr>

" ,y  show yanring
nnoremap <Leader>y :YRShow<cr>

" ,f  show file browser 
nnoremap <Leader>f :NERDTree<cr>

" use jj to cancel insert mode
inoremap jj <ESC> 

" disable F1 help, make it save current session instead
nnoremap <F1> :mksession! ~/.vim/Session.vim<cr>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ,r reload saved session
nnoremap <leader>r :source ~/.vim/Session.vim<cr>

nnoremap <leader><space> :noh<cr>

" - tweaks for snipmate ---------------------------------------------------
function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction

nmap <leader>rs :call ReloadSnippets(snippets_dir, &filetype)<CR>

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd bufwritepost vimrc source $MYVIMRC
endif

