# Jamie's Mac Development Environment Maintenance Guide

This guide covers how to keep your development environment up to date. Regular maintenance ensures you have the latest features, security patches, and bug fixes.

---

## Table of Contents

1. [Quick Update (Weekly)](#quick-update-weekly)
2. [Homebrew](#homebrew)
3. [Node.js (via nvm)](#nodejs-via-nvm)
4. [Ruby (via rbenv)](#ruby-via-rbenv)
5. [Oh My Zsh](#oh-my-zsh)
6. [Your Dotfiles](#your-dotfiles)
7. [VS Code](#vs-code)
8. [Claude Code](#claude-code)
9. [macOS](#macos)

---

## Quick Update (Weekly)

Run this once a week to keep everything current:

```bash
brew update && brew upgrade
```

This updates Homebrew and all packages installed through it (including git, gh, pygments, etc.).

---

## Homebrew

### Update Package List

```bash
brew update
```

### Upgrade All Packages

```bash
brew upgrade
```

### See What's Outdated

```bash
brew outdated
```

### Clean Up Old Versions

```bash
brew cleanup
```

### Check for Issues

```bash
brew doctor
```

This diagnoses common problems and suggests fixes.

---

## Node.js (via nvm)

### See Your Current Version

```bash
node -v
```

### List Installed Versions

```bash
nvm ls
```

### See Available Versions

```bash
nvm ls-remote
```

### Install Latest Node

```bash
nvm install node
```

### Install a Specific Version

```bash
nvm install 20
```

### Switch to a Different Version

```bash
nvm use 20
```

### Set Default Version

```bash
nvm alias default node
```

Or for a specific version:

```bash
nvm alias default 20
```

### Uninstall Old Versions

```bash
nvm uninstall 18
```

---

## Ruby (via rbenv)

### See Your Current Version

```bash
ruby -v
```

### List Installed Versions

```bash
rbenv versions
```

### See Available Versions

First, update ruby-build to get the latest version list:

```bash
brew upgrade ruby-build
```

Then list available versions:

```bash
rbenv install -l
```

### Install a New Ruby Version

```bash
rbenv install 3.3.0
```

### Set Global Default Version

```bash
rbenv global 3.3.0
```

### Uninstall Old Versions

```bash
rbenv uninstall 3.2.0
```

### Rehash (After Installing Gems with Executables)

```bash
rbenv rehash
```

---

## Oh My Zsh

### Update Oh My Zsh

```bash
omz update
```

Or manually:

```bash
cd ~/.oh-my-zsh && git pull
```

### Update Plugins

For the zsh-syntax-highlighting plugin:

```bash
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git pull
```

---

## Your Dotfiles

### Pull Latest Changes

If you've made changes on another machine:

```bash
cd ~/code/$(gh api user | jq -r '.login')/dotfiles && git pull
```

### Push Your Changes

After making local changes:

```bash
cd ~/code/$(gh api user | jq -r '.login')/dotfiles
git add -A
git commit -m "Update dotfiles"
git push
```

### Re-run the Installer

If you've added new files to your dotfiles:

```bash
cd ~/code/$(gh api user | jq -r '.login')/dotfiles && zsh install.sh
```

### Reload Your Configuration

After making changes to zshrc or aliases:

```bash
source ~/.zshrc
```

Or simply open a new terminal window.

---

## VS Code

### Update VS Code

VS Code updates automatically, but you can check manually:

1. Open VS Code
2. Click **Code** > **Check for Updates...**

Or via Homebrew:

```bash
brew upgrade --cask visual-studio-code
```

### Update Extensions

1. Open VS Code
2. Click the Extensions icon in the sidebar (or press `Cmd + Shift + X`)
3. Click the "..." menu at the top of the Extensions panel
4. Click "Check for Extension Updates"

---

## Claude Code

Claude Code is Anthropic's AI coding assistant for the terminal.

### Check Current Version

```bash
claude --version
```

### Update Claude Code

```bash
brew upgrade claude-code
```

### If You Don't Have Claude Code Installed

```bash
brew install claude-code
```

Then authenticate:

```bash
claude
```

Follow the prompts to log in with your Anthropic account.

---

## macOS

### Check for System Updates

1. Click the Apple menu () > **System Settings...**
2. Click **General** > **Software Update**
3. Install any available updates

Or via Terminal:

```bash
softwareupdate -l
```

To install all available updates:

```bash
sudo softwareupdate -ia
```

---

## Troubleshooting

### "Command not found" After Updates

Reload your shell configuration:

```bash
exec zsh
```

### Homebrew Permissions Issues

```bash
sudo chown -R $(whoami) /opt/homebrew
```

### NVM Not Found After Update

Make sure your zshrc has the correct paths for Homebrew's nvm:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
```

### Ruby Version Not Changing

Make sure rbenv is initialized in your zshrc:

```bash
eval "$(rbenv init -)"
```

Then reload:

```bash
exec zsh
```

---

## Recommended Update Schedule

| Component | Frequency | Command |
|-----------|-----------|---------|
| Homebrew packages | Weekly | `brew update && brew upgrade` |
| Homebrew cleanup | Monthly | `brew cleanup` |
| Node.js | As needed | `nvm install node` |
| Ruby | As needed | `rbenv install <version>` |
| Oh My Zsh | Monthly | `omz update` |
| VS Code | Automatic | (updates itself) |
| Claude Code | Monthly | `brew upgrade claude-code` |
| macOS | When prompted | System Settings > Software Update |

---

## Quick Health Check

Run these commands to verify everything is working:

```bash
echo "Homebrew: $(brew --version | head -1)"
echo "Git: $(git --version)"
echo "Node: $(node -v)"
echo "Ruby: $(ruby -v)"
echo "GitHub CLI: $(gh --version | head -1)"
echo "Claude Code: $(claude --version 2>/dev/null || echo 'not installed')"
```

You should see version numbers for all tools. If any show "command not found", revisit the [setup guide](jamies-setup-guide.md).
