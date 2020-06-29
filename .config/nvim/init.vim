call plug#begin('~/.vim/plugged')

" Theme & Colors
Plug 'tomasiser/vim-code-dark'
Plug 'mhartington/oceanic-next'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" COC
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Ctrl + P
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Wakatime
" Plug 'wakatime/vim-wakatime'

" Vue
Plug 'posva/vim-vue'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Comment
Plug 'tpope/vim-commentary'

call plug#end()

" Basic Config
set number
set nowrap
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
"set cursorline
syntax enable

" NERDTree config
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" COC Config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Ctrl P Config
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|vendor\|dist'

" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Split
nnoremap <silent> vv <C-w>v
nnoremap <silent> <C-h> <C-w>n

" Ctrl + / Commentary
map <C-_> :Commentary<cr>

" Default Colorscheme
colorscheme codedark

" Airline Config
let g:airline_theme = 'codedark'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Git Gutter Config
highlight GitGutterAdd    guifg=#009900 ctermfg=2 
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Vue file fast open
let g:vue_pre_processors='detect_on_enter'

set updatetime=100

