# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# speed settings
export CASE_SENSITIVE="true"
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' use-cache yes
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit
compinit -i -D

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# emacs
export EDITOR="emacs -nw"
e() {
    if [ $# -gt 0 ]
    then
	emacsclient -t --eval "(progn (find-file \""$@"\") (setq buffer-read-only nil))"
    else
	emacsclient -t --eval "(progn (setq buffer-read-only nil))"
    fi
}
ev() {
    emacsclient -t --eval "(progn (find-file \""$@"\") (setq buffer-read-only t))"
}

# colors
export LS_COLORS='di=1;35:fi=0:ln=1;32:pi=5:so=5:bd=5:cd=5:or=1;32:mi=0:ex=1;31:*.rpm=90'
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'

# aliases
export PAGER='less -S'
export PATH='/home/ubuntu/.local/bin':$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
