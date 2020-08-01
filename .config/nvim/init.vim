call plug#begin('~/.vim/plugged')

" Theme & Colors
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'

" Indent Guide
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Git
Plug 'tpope/vim-fugitive'

" Comment (Ctrl / + Ctrl /)
Plug 'tomtom/tcomment_vim'

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

" Code Folding
set foldmethod=syntax
set foldlevel=99
nnoremap <Space> za

" function! CleanFold()
"   let nl = v:foldend - v:foldstart + 1
"   let comment = substitute(getline(v:foldstart),"^ *","",1)
"   let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
"   let txt = '+ ' . comment . ' '  . nl
"   return txt
" endfunction
"
" set foldtext=CleanFold()

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Organize Import on save .go files
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
" map <C-_> :Commentary<cr>

" Default Colorscheme
colorscheme gruvbox 

" Airline Config
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" Git Gutter Config
highlight GitGutterAdd    guifg=#009900 ctermfg=2 
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Vue file fast open
let g:vue_pre_processors='detect_on_enter'

" Indent Guide Config
let g:indentLine_char = '▏'


set updatetime=100

