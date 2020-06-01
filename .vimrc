set nocompatible		" disable compatible with vi
filetype off			" disable filetype detetion
set hidden			" keep buffer history after flip to next file

" set path to vundle plugin manager and call it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle manage vundle
Plugin 'gmarik/Vundle.vim'	" Vundle Plugin Manager

" All plugins
"==================================================
"=                  P L U G I N S                 =
"==================================================
"------------------Code and Navigation-------------
Plugin 'scrooloose/nerdtree'		    " File navigation
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Git plugin for NerdTree
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'vim-ctrlspace/vim-ctrlspace'    " Tabs/Buffers/Fuzzy/Workspaces/Bookmarks
Plugin 'vim-airline/vim-airline'        " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes' " Themes for AirLine
Plugin 'Valloric/YouCompleteMe'         " Code Completion

"--------------------Others------------------------
Plugin '907th/vim-auto-save'                  " Autosave
Plugin 'vimwiki/vimwiki'		            " NoteTaking
Plugin 'mhinz/vim-startify'		            " Start Page
Plugin 'kien/rainbow_parentheses.vim'       " Rainbow Parentheses

"------------------Color Schemas-------------------
Plugin 'gruvbox-community/gruvbox'

"------------------Text Edit-----------------------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"------------------P Y T H O N --------------------
Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'hynek/vim-python-pep8-indent'

" Call vundle
call vundle#end()


"==================================================
"=	G E N E R A L     S E T T I N G S         =
"==================================================
filetype on
filetype plugin on
filetype plugin indent on

set encoding=utf-8		" utf-8 codepage
set t_Co=256			" 256b colors
syntax enable
set background=dark

" colorscheme settings
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_colors = { 'bg0': ['#000000', 0] }
colorscheme gruvbox
let g:airline_theme='gruvbox' 

set shell=/bin/zsh		" default shell
set relativenumber		" line numbers
set ttyfast			" terminal acceleration

set tabstop=4			" 4 whitespaces for tab button
set expandtab			" expand tabs into spaces
set autoindent			" indent when moving to the next line

set cursorline			" line under cursor
set showmatch			" show matching of bracket pairs

set enc=utf-8			" utf-8 by default

set noswapfile			" no swap files
set splitbelow          " split bottom

set backspace=indent,eol,start	" backspace removes all indents EOS's

set scrolloff=20		" let 10 lines before and after cursor during scroll

set nobackup            " no backup files
set nowritebackup       " only if you don't want to backup file while editing

" search settings
set incsearch           " incremental search
set hlsearch            " highlight search result

set concealcursor=inc


"==================================================
"=       P L U G I N S     S E T T I N G S        =
"==================================================
" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.markdown'}]

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
nmap " :NERDTreeToggle<CR>

" For MarkDown
autocmd BufEnter *.markdown set concealcursor=n

" vim-markdown
let g:vim_markdown_conceal_code_blocks=1
let g:vim_markdown_conceal=1

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
"==================================================
"=      P Y T H O N        S E T T I N G S        =
"==================================================
let g:pymode_python='python3'
let g:pymode_doc=0          " documentation
let g:pymode_doc_bind='K'   " documentation

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" Rainbow Parentheses Autoload 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

let g:ale_sign_column_always = 0
let g:ale_emit_conflict_warnings = 0
let g:airline#extensions#ale#enabled = 1
let g:pymode_rope_lookup_project = 0
let g:airline#extensions#tabline#enabled = 1

imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>


" Start Screen
autocmd StdinReadPre * let g:isReadingFromStdin = 1
autocmd VimEnter * nested if !argc() && !exists('g:isReadingFromStdin') | Startify | endif
autocmd VimEnter * nested if !argc() && !exists('g:isReadingFromStdin') | NERDTree | endif

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
" nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>
nmap <silent> <leader>q :bd<CR>



" Resize window by \+
nmap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nmap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" AutoSave options
let g:auto_save = 1  " enable AutoSave on Vim startup


"" UNCOMMIT THIS TO AUTOSAVE MARKDOWN ONLY
"let g:auto_save = 0
"augroup ft_markdown
"   au!
"  au FileType markdown let b:auto_save = 1
" augroup END
