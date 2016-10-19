set ls=2
set nu
set tabstop=2
set expandtab
set shiftwidth=2
set incsearch
set hlsearch
set backspace=2
set ruler
set showmatch
set autoindent
set smartindent
language messages en_US.UTF-8
set langmenu=en_US.UTF-8

if v:version < 700
  finish
endif


if has('gui_running')
  set guifont=MiscFixed\ 9.5
endif

hi Search cterm=NONE ctermfg=black ctermbg=white

set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

colorscheme jellybeans
syntax on
filetype plugin on

let Tlist_Ctags_Cmd='/usr/bin/ctags'

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

nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>	

nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-\>b :bufferS<cr>
nmap <C-\>v :vs <C-R>=expand("%p")<CR>

nmap <F5> :TlistToggle<CR>
nmap <F6> :set number!<CR>
nmap <F7> :set ic!<CR>
nmap <F8> :NERDTreeToggle<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map \f ma][%b%b"xy$`a:echo @x<CR>
