# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ethan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'

# Edit PATH
PATH="$PATH:$HOME/.local/bin"

# CTRL + arrow key to move
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Aliases
if [ -f $HOME/.config/zsh/aliasrc ]; then
	source $HOME/.config/zsh/aliasrc
fi
export PATH=$PATH:/home/ethan/.spicetify
