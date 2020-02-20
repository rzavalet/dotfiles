set ls=2
"set nu
set tabstop=2
set expandtab
set shiftwidth=2
"set ic
set incsearch
set hlsearch
set backspace=2
"set mouse=a
set ruler
set showmatch
set autoindent
set smartindent
language messages en_US.UTF-8
set langmenu=en_US.UTF-8




"------------------------------------
" Do not continue if using an old
" version of vim
"------------------------------------
if v:version < 700
  finish
endif

"------------------------------------
" Other plugins managed by
" Plug
"------------------------------------
" " Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://github.com/victorze/foo.git'
Plug 'https://github.com/nanotech/jellybeans.vim.git'

call plug#end()

"------------------------------------
" Use MiscFixed for a gui vim
"------------------------------------
if has('gui_running')
  set guifont=MiscFixed\ 9.5
endif


"------------------------------------
" Use a color scheme
"------------------------------------
colorscheme jellybeans

"syntax enable
"set background=dark " hyper or abyss
"set background=light " github
"colorscheme hyper

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
" Some CSCOPE settings
"------------------------------------
let Tlist_Ctags_Cmd='/scratch/rzavalet/usr/bin/ctags'

nnoremap <Leader>c : set cursorline! cursorcolumn! <CR>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

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
" Some Doxygen settings
"------------------------------------
let g:C_UseTool_cmake   = 'yes' 
let g:C_UseTool_doxygen = 'yes' 
let g:DoxygenToolkit_briefTag_pre = "NAME:*    "
let g:DoxygenToolkit_briefTag_post = " - ** PARAMETERS:" 
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_paramTag = "PARAMETERS:"
let g:DoxygenToolkit_paramTag_pre = "   "
let g:DoxygenToolkit_paramTag_post = "    (IN|OUT)  - "
let g:DoxygenToolkit_returnTag = "DESCRIPTION:*    * RETURNS:** NOTES:* "
let g:DoxygenToolkit_maxFunctionProtoLines = 20
let g:DoxygenToolkit_keepEmptyLineAfterComment = "yes"
let g:DoxygenToolkit_DescriptionTag = "DESCRIPTION:*    "
let g:DoxygenToolkit_NotesTag = "NOTES:*    "
let g:DoxygenToolkit_returnNothingTag ="    NOTHING"
map  :Dox


"------------------------------------
" This autocommand jumps to the last known position in a file
" just after opening it, if the '" mark is set:
"
" If the mark is set (i.e. is in a line between the first and the
" last), then go to ther mark.
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
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>


"------------------------------------
" Some nice mappings settings
"------------------------------------
nmap <C-\>b :bufferS<cr>
nmap <C-\>v :sp <C-R>=expand("%p")<CR>
nmap <C-\>co :!ade co -nc <C-R>=expand("%p")<CR><CR>

nmap <F5> :TlistToggle<CR>
nmap <F6> :set number!<CR>
nmap <F7> :set ic!<CR>
nmap <F8> :NERDTreeToggle<CR>



