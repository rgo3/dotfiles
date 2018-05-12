"
" Type :so % to refresh .vimrc after making changes
" Type :PlugInstall to update
"

if &compatible
  set nocompatible
end

call plug#begin('~/.vim/plugged')

""" Theme / Pretty stuff
"""
" [1]
Plug 'altercation/vim-colors-solarized'

" Fugitive will help with git related stuff, and show branch on status
Plug 'tpope/vim-fugitive' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" [2] File tree viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" [3] search filesystem with FZF Fuzzy Finder
Plug 'junegunn/fzf', {'dir': '~/fzf', 'do': './install --all'}

" [4] highlighting
Plug 'scrooloose/syntastic' "Syntax Highlighting
Plug 'nvie/vim-flake8'

" [5] Features
Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
Plug 'tpope/vim-repeat' "allow plugins to utilize . command
Plug 'tpope/vim-surround' "easily surround things...just read docs for info
Plug 'vim-scripts/matchit.zip' " % also matches HTML tags / words / etc
Plug 'duff/vim-scratch' "Open a throwaway scratch buffer
Plug 'scrooloose/nerdcommenter' "Easy and nice commenting

" [6] Diary, notes, whatever. It's amazing
Plug 'vimwiki/vimwiki'

" [7] Opens a browser to preview markdown files
" For this to work, you need to type npm install -g instant-markdown-d
Plug 'suan/vim-instant-markdown'

" [8] Deoplete + Autocompletion and language extensions: Python, Go, Scala
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Python
Plug 'zchee/deoplete-jedi'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', {'rtp': 'nvim/'}
Plug 'godoctor/godoctor.vim'
Plug 'jnwhiteh/vim-golang'

" Scala
Plug 'derekwyatt/vim-scala'

" [9] wakatime to record coding in vim
" Plug 'wakatime/vim-wakatime'

call plug#end()

set ttyfast
set lazyredraw

let $PATH='/usr/local/bin:' . $PATH

:au FocusLost * :wa "Save on focus lost

" Sessions
let g:session_autoload = 'no'

" Toggle nerdtree with F2
map <F2> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F3> :NERDTreeFind<CR>
" Toggle :CheckHealth
map <F4> :CheckHealth<CR>
" Toggle :PlugUpdate
map <F5> :PlugUpdate<CR>


" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

set backspace=2	  " Backspace deletes like most programs in insert mode
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79

  " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'
endif

" Airline
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'

set t_Co=256

:set smartcase
:set ignorecase

" Color scheme
syntax enable
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']
let python_highlight_all=1

" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

""" Go settings
" Highlighting
let g:go_highlight_funtions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" Snippets
let g:go_snippet_engine = "neosnippet"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" Numbers
set number
set numberwidth=5
set relativenumber

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" convert hash rockets
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Easy navigation between splits. Instead of ctrl-w + j. Just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy & Paste
if has('clipboard') && !has('gui_running')
	vnoremap <C-c> "+y
	vnoremap <C-x> "+d
	vnoremap <C-v> "+p
	inoremap <C-v> <C-r><C-o>+
endif
