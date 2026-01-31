# Claude Code Setup Guide

Instructions for setting up Claude Code on a new machine.

---

## Prerequisites

### Terminal & Shell
- [ ] Homebrew installed (`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`)
- [ ] Oh My Zsh installed (`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`)

### Development Tools
- [ ] VS Code installed (`brew install --cask visual-studio-code`)
- [ ] Claude Code CLI installed (`brew install --cask claude-code`)
- [ ] Node.js via NVM (see NVM section below)

### For Ruby/Rails Development
- [ ] rbenv installed (`brew install rbenv ruby-build`)

---

## Step 1: Clone and Install Dotfiles

```bash
# Clone dotfiles
git clone git@github.com:dujaje/dotfiles.git ~/Documents/code/dujaje/dotfiles

# Run installer (symlinks configs + installs zsh plugins + sets up Claude)
cd ~/Documents/code/dujaje/dotfiles
./install.sh
```

The install script will:
- Symlink zshrc, gitconfig, aliases, etc. to your home directory
- Install zsh-syntax-highlighting plugin
- Symlink Claude CLAUDE.md to ~/.claude/
- Configure git to use VS Code as editor

---

## Step 2: Install NVM (Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Restart terminal, then install Node
nvm install --lts
nvm use --lts
```

---

## Step 3: Install Ruby (Optional - for Rails development)

```bash
# Install a Ruby version
rbenv install 3.3.0
rbenv global 3.3.0

# Verify
ruby --version
```

---

## Step 4: Add MCP Servers

Add your universal MCP servers (available in all projects):

```bash
# Craft (personal note-taking)
claude mcp add --transport http craft-docs --scope user https://mcp.craft.do/links/2Jdsktu84i2/mcp

# Add other universal MCPs here as needed
```

---

## Step 5: Verify Setup

1. Restart your terminal (or run `source ~/.zshrc`)
2. Verify commands work:
   ```bash
   claude --version    # Should show Claude CLI version
   node --version      # Should show Node version
   ruby --version      # Should show Ruby version (if installed)
   ```
3. Open VS Code and start Claude Code
4. Ask: "What's in my universal CLAUDE.md?"

---

## MCP Servers Reference

| Name | Purpose | Command |
|------|---------|---------|
| craft-docs | Personal note-taking | `claude mcp add --transport http craft-docs --scope user https://mcp.craft.do/links/2Jdsktu84i2/mcp` |

---

## Troubleshooting

### CLAUDE.md not found
```bash
# Verify symlink exists and points correctly
ls -la ~/.claude/CLAUDE.md
```

### MCP server not available
```bash
# List all configured MCPs
claude mcp list

# Re-add if missing
claude mcp add --transport http craft-docs --scope user https://mcp.craft.do/links/2Jdsktu84i2/mcp
```

### zsh-syntax-highlighting not working
```bash
# Re-run the plugin installation
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
source ~/.zshrc
```

### Claude CLI not found
```bash
# Ensure Homebrew is in PATH (should be first line in zshrc)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Reinstall if needed
brew install --cask claude-code
```

---

*Last updated: January 2026*
