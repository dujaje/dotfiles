# Homebrew (must be first on Apple Silicon Macs)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Oh My Zsh configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Plugins
plugins=(gitfast brew last-working-dir common-aliases zsh-syntax-highlighting history-substring-search)

# Prevent Homebrew from reporting
export HOMEBREW_NO_ANALYTICS=1

# Load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# rbenv (Ruby version manager)
eval "$(rbenv init -)"

# PATH additions
# - ./bin for Rails binstubs
# - ./node_modules/.bin for local npm packages
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Load custom aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# NVM (Node Version Manager) - Homebrew installation
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Editor configuration (VS Code)
export EDITOR="code --wait"
export BUNDLER_EDITOR="code"
