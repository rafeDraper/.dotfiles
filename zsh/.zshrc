source ~/zsh-snap/znap.zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/rafaelgarciadealba/.oh-my-zsh"
export DOTFILES=$HOME/.dotfiles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# Skip verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# Example aliases
alias py="python3"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias xhr="cd ~/Xion/xhr"
alias xboard="cd ~/Xion/xboard"
alias k8s="cd ~/Xion/managed-k8s"
alias xsurance="cd ~/Xion/xsurance"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias pgrnd="cd ~/Xion/k8splayground"
alias luamake=/Users/rafaelgarciadealba/lsp-lservers/lua-language-server/3rd/luamake

# User configuration

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)
. /opt/homebrew/opt/asdf/asdf.sh
. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash
