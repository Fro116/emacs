# customized prompt output
PS1='\[\e[36m\]\h:\W \u\$\[\e[m\] '


# colorized ls
# on OS X
export LSCOLORS=FxDxhxDxBxhxhxhxhxcxcx
export LS_OPTIONS='--color=auto'
alias ls='ls -G -F -h'

# on Linux
# export LS_COLORS='di=1;35:fi=0:ln=1;32:pi=5:so=5:bd=5:cd=5:or=1;32:mi=0:ex=1;31:*.rpm=90'
# alias ls='ls --color=auto -F'

# colorized grep
alias grep='grep --color=auto'

# emacs
alias e='emacs -nw'
export EDITOR=emacs

# remap caps lock to ctrl
# xmodmap ~/.xmodmap

# search for a file
function search(){
    find . -maxdepth 1 -iname "*$1*"
}