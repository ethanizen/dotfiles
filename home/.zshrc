ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM=~/.config/zsh/
ZSH_THEME="mytheme"
DISABLE_AUTO_UPDATE="true"
FZF_BASE="/usr/share/fzf"
plugins=(
    fzf
    git
    z
    cp
    sudo
    fancy-ctrl-z
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

[[ -f "$ZSH/oh-my-zsh.sh" ]] \
	&& source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.local/scripts/" ] ; then
    export PATH="$HOME/.local/scripts/:$PATH"
fi

[[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
    && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
    && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Config directory changes
ATOM_HOME=$XDG_CONFIG_HOME/.atom
CARGO_HOME=$XDG_CONFIG_HOME/.cargo

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Virtualenv
export WORKON_HOME=$HOME/.config/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /home/howley/.local/bin/virtualenvwrapper.sh
