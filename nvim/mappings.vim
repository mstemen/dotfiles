" Description: for mappings NOT related to plugins.
" *** Mapping related to plugins go IN the plugin file itself, to be consistent. ***

" LEGEND -> Run ':help key-notation' for vim
" REMINDER: must enable "Esc+" on iTerm for meta keys to function properly

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" get me out
inoremap jj <ESC>
inoremap kk <ESC>

" saves the current buffer
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" make 'Y' yank for current character to end of line
map Y y$

" move current line/selected lines up/down
nnoremap <M-S-j> :m .+1<CR>==
nnoremap <M-S-k> :m .-2<CR>==
inoremap <M-S-j> <Esc>:m .+1<CR>==gi
inoremap <M-S-k> <Esc>:m .-2<CR>==gi
vnoremap <M-S-j> :m '>+1<CR>gv=gv
vnoremap <M-S-k> :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" navigate splits
nnoremap <silent> <Tab>   <C-w>w
nnoremap <silent> <S-Tab> <C-w>W

" increase/decrease window size
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> - :resize -5<CR>
nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> _ :vertical resize -5<CR>

" so that vim-sandwich works
map <silent> s <nop>
map <silent> S <nop>

" better indentation selection stuff
vnoremap < <gv
vnoremap > >gv
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" remap q to Q
nnoremap Q q
nnoremap q <nop>

" horizontal scrolling when wrapped
nnoremap <C-l> 20zl
nnoremap <C-h> 20zh

" better 'G'
nmap G Gzz
