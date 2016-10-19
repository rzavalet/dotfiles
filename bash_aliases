alias la='ls -lAXh --color=always'   #Show all, sort by extension 
alias ls-al='ls -al'   #fix typo missing space 

alias t='tail -f'

alias l="ls -1"
alias ll="ls -l"
alias la="ls -la"

alias cd..='cd ..'
alias ..='cd ..'

alias vi='TERM=xterm-256color vim'
alias vimdiff='TERM=xterm-256color vimdiff'
alias dirs='dirs -v'

alias terminal='gnome-terminal --disable-factory'

alias p=pushd

CSCOPE_VERSION=`vim -version 2>&1 | head -1 |  awk '{print $5}'`
if [ "$CSCOPE_VERSION" == "7.4" ]
then
    alias cscope=/usr/local/bin/cscope
else
    alias cscope=/usr/bin/cscope 
fi

alias sessions='tmux list-session'
alias attach='tmux attach-session -d -t'