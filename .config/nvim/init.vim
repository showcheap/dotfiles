call plug#begin('~/.vim/plugged')

" Theme & Colors
Plug 'tomasiser/vim-code-dark'
Plug 'mhartington/oceanic-next'
"Plug 'sheerun/vim-polyglot'
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
"Plug 'posva/vim-vue'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

" Emmet Vim
let g:user_emmet_leader_key=','


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

" ALE Config
"let g:ale_completion_enabled = 1
"let g:ale_go_bingo_executable = 'gopls'
"let g:ale_linters = {'go':['bingo']}
"set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Vim Go Config
"let g:go_fmt_command = "goimports"
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_highlight_function_calls = 1
"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1


" Ctrl P Config
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|vendor\|dist'

" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Split
nnoremap <silent> vv <C-w>v
nnoremap <silent> <C-h> <C-w>n

" Default Colorscheme
colorscheme OceanicNext

" Airline Config
"let g:airline_theme = 'codedark'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Git Gutter Config
highlight GitGutterAdd    guifg=#009900 ctermfg=2 
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

set updatetime=100

