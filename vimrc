"------------------------------------
" Disable the default Vim startup message.
"------------------------------------
set shortmess+=I

set ls=2

"------------------------------------
" Show line numbers.
"------------------------------------
set number

"------------------------------------
" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
"------------------------------------
"set relativenumber

"------------------------------------
" Always show the status line at the bottom, even if you only have one window open.
"------------------------------------
set laststatus=2

"------------------------------------
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
"------------------------------------
set ignorecase
set smartcase

"------------------------------------
" Tabs are 2 whitespaces
"------------------------------------
set tabstop=2

set expandtab
set shiftwidth=2

"------------------------------------
" Start searching while writing pattern
"------------------------------------
set incsearch

"------------------------------------
" Highlight search results
"------------------------------------
set hlsearch

set backspace=2
set ruler
set showmatch
set autoindent
set smartindent

"------------------------------------
" Autocomplete when opening a file
"------------------------------------
set wildmenu

language messages en_US.UTF-8
set langmenu=en_US.UTF-8

" Disabled options...
"set mouse=a

"------------------------------------
" Unbind some useless/annoying default key bindings.
"------------------------------------
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

"------------------------------------
" Disable audible bell because it's annoying.
"------------------------------------
set noerrorbells visualbell t_vb=

"------------------------------------
" Do not continue if using an old
" version of vim
"------------------------------------
if v:version < 700
  finish
endif


"------------------------------------
" Use MiscFixed for a gui vim
"------------------------------------
if has('gui_running')
  set guifont=MiscFixed\ 9.5
endif

"------------------------------------
" Use jellybeans color scheme
"------------------------------------
colorscheme jellybeans

"------------------------------------
" Highlight syntax for the filetype
"------------------------------------
syntax on
filetype plugin on

"------------------------------------
" Highlight the current match of the
" search with color
" black on white
"------------------------------------
"autocmd ColorScheme * highlight search cterm=NONE ctermfg=black ctermbg=white
"highlight search cterm=NONE ctermfg=black ctermbg=white

"------------------------------------
" Highlight Cursor
"------------------------------------
set cursorline
"autocmd ColorScheme * highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"------------------------------------
" Highlight the current line
"------------------------------------
set cursorcolumn
"autocmd ColorScheme * highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"------------------------------------
" Status line colors:
" 0  = black
" 7  = light gray
" 15 = white
"------------------------------------
if has("autocmd")
autocmd ColorScheme * highlight StatusLine ctermfg=0 ctermbg=15 cterm=NONE
autocmd ColorScheme * highlight StatusLineNC ctermfg=0 ctermbg=7 cterm=NONE
endif
"hi StatusLine ctermfg=0 ctermbg=15 cterm=NONE
"hi StatusLineNC ctermfg=0 ctermbg=7 cterm=NONE



"------------------------------------
" Let's train ourselves
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
"------------------------------------
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>



nnoremap <Leader>c : set cursorline! cursorcolumn! <CR>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>


nmap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>


"------------------------------------
" Mappings for gtags. Taken from gtags.vim
"------------------------------------
"let Gtags_Auto_Map = 1
nmap <C-\><C-]> :GtagsCursor<CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>


"------------------------------------
" Some Doxygen settings
"------------------------------------
let g:C_UseTool_cmake   = 'yes'
let g:C_UseTool_doxygen = 'yes'
let g:DoxygenToolkit_briefTag_pre = "NAME:^M*    "
let g:DoxygenToolkit_briefTag_post = " - ^M*^M* PARAMETERS:"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_paramTag = "PARAMETERS:"
let g:DoxygenToolkit_paramTag_pre = "   "
let g:DoxygenToolkit_paramTag_post = "    (IN|OUT)  - "
let g:DoxygenToolkit_returnTag = "DESCRIPTION:^M*    ^M* RETURNS:^M*^M* NOTES:^M* "
let g:DoxygenToolkit_maxFunctionProtoLines = 20
let g:DoxygenToolkit_keepEmptyLineAfterComment = "yes"
let g:DoxygenToolkit_DescriptionTag = "DESCRIPTION:^M*    "
let g:DoxygenToolkit_NotesTag = "NOTES:^M*    "
let g:DoxygenToolkit_returnNothingTag ="    NOTHING"
map ^X :DoxESC


"------------------------------------
" This autocommand jumps to the last known position in a file
" just after opening it, if the '" mark is set:
"
" If the mark is set (i.e. is in a line between the first and the
" last), then go to the mark.
"
" BufReadPost: When starting to edit a new buffer, after
" reading the file into the buffer, before
" executing the modelines.
"------------------------------------
if has("autocmd")
  autocmd BufReadPost   *     if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"------------------------------------
" Get the name of the function
"------------------------------------
map \f ma][%b%b"xy$`a:echo @x<CR>

"------------------------------------
" These are mappings for using tabs
" in vim
"------------------------------------
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit <C-R>=expand("%p")<CR><CR>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>


"------------------------------------
" Some nice mappings settings
"------------------------------------
nmap <C-\>v :sp <C-R>=expand("%p")<CR>

nmap <F5> :TlistToggle<CR>
nmap <F6> :set number!<CR>
nmap <F7> :set ic!<CR>
nmap <F8> :NERDTreeToggle<CR>


"------------------------------------
" Other plugins managed by
" Plug
"------------------------------------
" " Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"Plug 'https://github.com/adelarsq/vim-matchit'
"Plug 'https://tpope.io/vim/surround.git'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/aperezdc/vim-template.git'

" Conversion between bases
Plug 'https://github.com/glts/vim-magnum.git'
Plug 'https://github.com/glts/vim-radical.git'

" Nice status bar
Plug 'https://github.com/vim-airline/vim-airline.git'

Plug 'https://github.com/vim-scripts/CCTree.git'
"
"Plug 'https://github.com/vim-scripts/gtags.vim'
"Plug 'https://github.com/whatot/gtags-cscope.vim.git'
"Plug 'https://github.com/tpope/vim-surround.git'
"Plug 'https://github.com/tpope/vim-repeat.git'
call plug#end()
