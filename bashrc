# enable color support of ls and also add handy aliases
# customized ls output
    # export LS_COLORS='di=1;35:fi=0:ln=1;32:pi=5:so=5:bd=5:cd=5:or=1;32:mi=0:ex=1;31:*.rpm=90'
    export LSCOLORS=FxDxhxDxBxhxhxhxhxcxcx
    export LS_OPTIONS='--color=auto'
    alias ls='ls -G -F -h'
    # customized prompt output
    PS1='\[\e[36m\]\h:\W \u\$\[\e[m\] '
    # customized grep output
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    # some more ls aliases                                                     
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias ltr='ls -ltr'

# customized file commands
clean () {
    files=`ls | grep -E '.*~' | wc -l`
    if [ $files -gt 0 ]
    then
        rm *~
    fi
    files=`ls | grep -E '\#.*\#' | wc -l`
    if [ $files -gt 0 ]
    then
        rm \#*\#
    fi
    #for hidden files
    files=`ls -a | grep -E '.*~' | wc -l`
    if [ $files -gt 0 ]
    then
        rm .*~
    fi
}

# emacs
alias e='emacs -nw'
export EDITOR=emacs