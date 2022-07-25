# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap source ohmyzsh/ohmyzsh plugins/{colored-man-pages,aliases,common-aliases}
 znap prompt spaceship-prompt/spaceship-prompt
# znap prompt zthxxx/jovial
# znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
znap source asdf-vm/asdf asdf.sh
znap source marlonrichert/zsh-autocomplete
zstyle ':autocomplete:*' min-input 1
znap source marlonrichert/zsh-edit
znap source marlonrichert/zsh-hist
#
# bindkey '^[q' push-line-or-edit
# bindkey -r '^Q' '^[Q'
#
ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

# Cache the output of slow commands with `znap eval`.
# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
# znap source marlonrichert/zcolors
# znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Here we include the full path to a command. Since that path includes a
# version number, the cache will be invalidated when that changes.
# znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
znap eval omz-git 'curl -fsSL \
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

# For each of the examples below, the `eval` statement on the right is not
# executed until you try to execute the associated command or try to use
# completion on it.

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv

# Rafa aliases
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
alias lg='lazygit'

# Rafa PATHS
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

# Wireguard 
function stopwg {
 
sudo bash -c 'ls ./.config/wireguard/*.conf' | xargs -n1 sudo wg-quick down
 
}

function startwg {
 
sudo bash -c 'ls ./.config/wireguard/*.conf' | xargs -n1 sudo wg-quick up
 
}

