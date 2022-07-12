# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap
# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
  docker
  docker-compose
)

# Example aliases
alias py="python3"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias xhr="cd ~/Xion/xhr"
alias xoncall="cd ~/Xion/xoncall"
alias xboard="cd ~/Xion/xboard"
alias k8s="cd ~/Xion/managed-k8s"
alias xsurance="cd ~/Xion/xsurance"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias v="nvim"
alias pgrnd="cd ~/Xion/k8splayground"
alias luamake=/Users/rafaelgarciadealba/lsp-lservers/lua-language-server/3rd/luamake

# User configuration

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/Users/rafaelgarciadealba/Library/Python/3.9/bin:$PATH
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)
. /opt/homebrew/opt/asdf/libexec/asdf.sh
alias lg='lazygit'
eval "$(pyenv init -)"

# Wireguard 
function stopwg {
 
sudo bash -c 'ls ./.config/wireguard/*.conf' | xargs -n1 sudo wg-quick down
 
}

function startwg {
 
sudo bash -c 'ls ./.config/wireguard/*.conf' | xargs -n1 sudo wg-quick up
 
}

