#!/bin/zsh

# Dotfiles installer
# Creates symlinks from home directory to dotfiles

backup() {
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file (not symlink)?
      mv "$target" "$target.backup"   # Then backup it
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

# Symlink dotfiles
echo "=== Symlinking dotfiles ==="
for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    # Skip shell scripts and README
    if [[ ! "$name" =~ '\.sh$' ]] && [[ ! "$name" =~ '\.md$' ]]; then
      backup $target

      if [ ! -e "$target" ]; then
        echo "-----> Symlinking $target"
        ln -s "$PWD/$name" "$target"
      else
        echo "-----> $target already exists (symlink)"
      fi
    fi
  fi
done

# Install zsh-syntax-highlighting plugin
echo ""
echo "=== Installing zsh plugins ==="
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR"

if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
else
  echo "-----> zsh-syntax-highlighting already installed"
fi

# Claude Code setup
echo ""
echo "=== Claude Code setup ==="
if [ -d "$PWD/claude" ]; then
  mkdir -p "$HOME/.claude"
  if [ ! -L "$HOME/.claude/CLAUDE.md" ]; then
    backup "$HOME/.claude/CLAUDE.md"
    echo "-----> Symlinking Claude config"
    ln -s "$PWD/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
  else
    echo "-----> Claude config already symlinked"
  fi
fi

# Git configuration
echo ""
echo "=== Git configuration ==="
git config --global core.editor "code --wait"
echo "-----> Set git editor to VS Code"

echo ""
echo "Done! Restart your terminal or run: source ~/.zshrc"
