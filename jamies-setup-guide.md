# Jamie's Mac Development Environment Setup Guide

This guide will walk you through setting up any new Mac computer as your perfect development environment. It's based on the Le Wagon bootcamp setup, customized for your needs as a product manager who occasionally works with code.

**Important:** Follow each step in order. Don't skip ahead, as some steps depend on previous ones being completed.

---

## Table of Contents

1. [Before You Start](#before-you-start)
2. [GitHub Account](#github-account)
3. [Understanding the Terminal](#understanding-the-terminal)
4. [Command Line Tools](#command-line-tools)
5. [Homebrew (Package Manager)](#homebrew-package-manager)
6. [Git and GitHub CLI](#git-and-github-cli)
7. [Oh My Zsh (Beautiful Terminal)](#oh-my-zsh-beautiful-terminal)
8. [Your Dotfiles (Personal Configuration)](#your-dotfiles-personal-configuration)
9. [Visual Studio Code](#visual-studio-code)
10. [Node.js (Optional)](#nodejs-optional)
11. [Ruby (Optional)](#ruby-optional)
12. [PostgreSQL (Optional)](#postgresql-optional)
13. [macOS Settings](#macos-settings)
14. [Verification](#verification)

---

## Before You Start

### What You'll Need
- A Mac computer (this guide is for macOS only)
- An internet connection
- About 1-2 hours of time
- Your GitHub account credentials

### A Note About Quitting Apps on Mac

When you click the red "X" button on a Mac window, **the app doesn't actually close** - it just closes that window. Throughout this guide, when asked to "quit and restart" an app, you need to:

1. Click on the app name in the menu bar at the top of your screen
2. Click "Quit [App Name]"

OR use the keyboard shortcut: `Cmd + Q`

---

## GitHub Account

If you don't already have a GitHub account, create one now at [github.com/join](https://github.com/join).

### Setting Up Your Profile

1. Go to [github.com/settings/profile](https://github.com/settings/profile)
2. Upload a profile picture
3. Add your name

### Enable Two-Factor Authentication (Important for Security)

1. Go to [github.com/settings/security](https://github.com/settings/security)
2. Click "Enable two-factor authentication"
3. Follow the prompts (you can use your phone for authentication codes)

---

## Understanding the Terminal

The Terminal is a way to interact with your computer using text commands instead of clicking on icons. It might seem intimidating at first, but you'll get used to it!

### How to Open Terminal

1. Press `Cmd + Space` to open Spotlight Search
2. Type "Terminal"
3. Press `Enter`

A white or black window will open - this is your Terminal.

### Important Terminal Concepts

**What is a "command"?**
A command is text you type into the Terminal, then press `Enter` to run it. For example:
```bash
echo "Hello World"
```
This command tells the computer to print "Hello World" on the screen.

**What does "copy-paste" mean in Terminal?**
- To **copy** from this guide: Select the text and press `Cmd + C`
- To **paste** into Terminal: Press `Cmd + V`

**What happens when I type a password?**
When the Terminal asks for your password, **nothing will appear on screen as you type** - no dots, no asterisks, nothing. This is normal and is a security feature. Just type your password and press `Enter`.

---

## Command Line Tools

These are essential tools from Apple that allow you to use developer software on your Mac.

### Step 1: Install Command Line Tools

Open Terminal and copy-paste this command, then press `Enter`:

```bash
xcode-select --install
```

**What will happen:**
- If you see a popup window, click "Install" and wait for it to finish (this can take 5-10 minutes)
- If you see the message `command line tools are already installed`, that's great - move on to the next section

**If you get an error:**
If you see "Xcode is not currently available from the Software Update server", run this command:
```bash
sudo softwareupdate --clear-catalog
```
Then try the install command again.

---

## Homebrew (Package Manager)

Homebrew is like an "app store" for developer tools that runs in the Terminal. It makes installing software much easier.

### Step 1: Install Homebrew

Copy-paste this entire command into Terminal and press `Enter`:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**What will happen:**
1. It will ask you to press `Enter` to continue - press `Enter`
2. It will ask for your Mac password - type it (remember, nothing will appear as you type) and press `Enter`
3. Wait for the installation to complete (this can take several minutes)

### Step 2: Add Homebrew to Your PATH (Important!)

After installation, you might see a warning message with "Next steps". If your Mac has an Apple Silicon chip (M1, M2, M3, etc.), you **must** run these two commands:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Step 3: Verify Homebrew is Working

Run this command:
```bash
brew --version
```

You should see a version number like `Homebrew 4.x.x`. If you see this, Homebrew is installed correctly!

### Step 4: Update Homebrew

```bash
brew update
```

**If you get an error about `/usr/local must be writable`**, run this command first, then try `brew update` again:
```bash
sudo chown -R $USER:admin /usr/local
```

### Step 5: Install Essential Tools

Now we'll install several useful tools. Copy-paste each command one at a time, pressing `Enter` after each:

```bash
brew upgrade git || brew install git
```

```bash
brew upgrade gh || brew install gh
```

```bash
brew upgrade wget || brew install wget
```

```bash
brew upgrade jq || brew install jq
```

**What these tools do:**
- `git` - Version control system (tracks changes to your files)
- `gh` - GitHub's official command-line tool
- `wget` - Downloads files from the internet
- `jq` - Processes JSON data (useful for working with APIs)

---

## Git and GitHub CLI

Git tracks changes to your code files. GitHub CLI lets you interact with GitHub from your Terminal.

### Step 1: Log into GitHub from Terminal

Copy-paste this command:

```bash
gh auth login -s 'user:email' -w --git-protocol ssh
```

**What will happen - follow these prompts:**

1. **"What account do you want to log into?"** - Select `GitHub.com` using arrow keys, press `Enter`

2. **"What is your preferred protocol for Git operations?"** - Select `SSH`, press `Enter`

3. **"Generate a new SSH key to add to your GitHub account?"** - Press `Enter` for Yes

4. **"Enter a passphrase for your new SSH key"** - Type a password you'll remember (this protects your SSH key), press `Enter`

5. **"Title for your SSH key"** - Just press `Enter` to accept the default

6. **You'll see a one-time code** like `ABCD-1234` - Copy this code!

7. **Press `Enter`** - Your browser will open to GitHub

8. **In your browser:**
   - Paste the code you copied
   - Click "Continue"
   - Click "Authorize github"

9. **Return to Terminal** and press `Enter`

### Step 2: Verify You're Logged In

```bash
gh auth status
```

You should see something like: `Logged in to github.com as YOUR_USERNAME`

---

## Oh My Zsh (Beautiful Terminal)

Oh My Zsh makes your Terminal look nicer and adds helpful features like showing which folder you're in and which Git branch you're on.

### Step 1: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**What will happen:**
- If asked "Do you want to change your default shell to zsh?", type `Y` and press `Enter`
- Your Terminal prompt will change to look colorful with a `~` and `%` or `$`

### Step 2: Quit and Restart Terminal

1. Press `Cmd + Q` to quit Terminal
2. Open Terminal again (Cmd + Space, type "Terminal", press Enter)

---

## Your Dotfiles (Personal Configuration)

"Dotfiles" are configuration files that customize how your Terminal and development tools behave. You have your own personal dotfiles stored on GitHub that we'll now set up.

### Step 1: Set Your GitHub Username Variable

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
```

### Step 2: Verify It Worked

```bash
echo $GITHUB_USERNAME
```

You should see your GitHub username printed. If not, make sure you completed the GitHub CLI login step above.

### Step 3: Create Your Code Folder

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
```

**What this does:** Creates a folder structure like `~/code/YOUR_USERNAME/` where you'll keep your code projects, then moves you into that folder.

### Step 4: Clone Your Dotfiles

If you already have your own dotfiles repository (forked from lewagon/dotfiles), clone it:

```bash
gh repo clone $GITHUB_USERNAME/dotfiles
```

If you don't have a dotfiles repo yet, fork the Le Wagon one first:

```bash
gh repo fork lewagon/dotfiles --clone
```

### Step 5: Navigate to Your Dotfiles Folder

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles
```

### Step 6: Run the Dotfiles Installer

```bash
zsh install.sh
```

**What this does:**
- Creates "symbolic links" (shortcuts) from your home folder to your dotfiles
- This means changes you make to your dotfiles will automatically apply
- Installs useful Zsh plugins

### Step 7: Set Up Your Git Identity

```bash
zsh git_setup.sh
```

**What will happen:**
1. It will ask for your name - type your full name (e.g., "Jamie Dujardin"), press `Enter`
2. It will ask for your email - use the email associated with your GitHub account, press `Enter`

### Step 8: Install the Zsh Syntax Highlighting Plugin

This makes your Terminal commands colored (green = valid command, red = error):

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Step 9: Reload Your Terminal Configuration

```bash
exec zsh
```

Your Terminal should now have your personal configuration loaded!

---

## Visual Studio Code

VS Code is a powerful, free code editor that you'll use for viewing and editing files.

### Step 1: Install VS Code

```bash
brew install --cask visual-studio-code
```

### Step 2: Launch VS Code

```bash
code
```

A VS Code window should open. If it does, VS Code is installed correctly!

### Step 3: Enable 'code' Command in Terminal (If Needed)

If the `code` command doesn't work:
1. Open VS Code manually (from Applications folder)
2. Press `Cmd + Shift + P` to open the Command Palette
3. Type "shell command"
4. Click "Shell Command: Install 'code' command in PATH"

### Step 4: Install Useful Extensions

Copy-paste each command one at a time:

```bash
code --install-extension ms-vscode.sublime-keybindings
```

```bash
code --install-extension emmanuelbeziat.vscode-great-icons
```

```bash
code --install-extension github.github-vscode-theme
```

```bash
code --install-extension MS-vsliveshare.vsliveshare
```

```bash
code --install-extension dbaeumer.vscode-eslint
```

**What these extensions do:**
- **Sublime Keybindings** - Familiar keyboard shortcuts
- **Great Icons** - Pretty file icons in the sidebar
- **GitHub Theme** - Nice color theme
- **Live Share** - Share your code with others in real-time
- **ESLint** - Highlights JavaScript errors

---

## Node.js (Optional)

Node.js lets you run JavaScript outside a web browser. This is useful if you work with JavaScript-based tools.

### Step 1: Install NVM (Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
```

### Step 2: Reload Terminal

```bash
exec zsh
```

### Step 3: Verify NVM is Installed

```bash
nvm -v
```

You should see a version number like `0.39.1`.

### Step 4: Install Node.js

```bash
nvm install 20
```

### Step 5: Verify Node is Installed

```bash
node -v
```

You should see something like `v20.x.x`.

### Step 6: Clean Up

```bash
nvm cache clear
```

---

## Ruby (Optional)

Ruby is a programming language. If you need to work with Ruby projects, follow these steps.

### Step 1: Install rbenv (Ruby Version Manager)

```bash
brew install rbenv libyaml
```

### Step 2: Reload Terminal

```bash
exec zsh
```

### Step 3: Install Ruby

This takes 5-10 minutes:

```bash
rbenv install 3.3.5
```

### Step 4: Set Default Ruby Version

```bash
rbenv global 3.3.5
```

### Step 5: Reload and Verify

```bash
exec zsh
```

```bash
ruby -v
```

You should see `ruby 3.3.5...`

---

## PostgreSQL (Optional)

PostgreSQL is a database. Only install this if you need to work with databases locally.

### Step 1: Install PostgreSQL

```bash
brew install postgresql@15 libpq
```

```bash
brew link --force libpq
```

### Step 2: Start PostgreSQL Service

```bash
brew services start postgresql@15
```

### Step 3: Verify It's Working

```bash
psql -d postgres
```

You should see a `postgres=#` prompt. Type `\q` and press `Enter` to exit.

---

## macOS Settings

These settings make your Mac more developer-friendly.

### Keyboard Speed

Faster key repeat makes coding more efficient:

1. Click the Apple menu () in the top-left corner
2. Click "System Settings..."
3. Click "Keyboard"
4. Set "Key repeat rate" to the fastest (far right)
5. Set "Delay until repeat" to the shortest (far right)

### Security Settings

Protect your computer:

1. Go to  > System Settings... > Lock Screen
2. Set "Require password after screen saver begins" to "5 seconds" or "Immediately"

### Hot Corners (Quick Lock)

Set up a quick way to lock your screen:

1. Go to  > System Settings... > Desktop & Dock
2. Scroll down and click "Hot Corners..."
3. Set one corner (I recommend bottom-right) to "Lock Screen"

Now moving your mouse to that corner will lock your computer!

### Terminal Appearance

Make your Terminal easier on the eyes:

1. Open Terminal
2. Go to Terminal > Settings (or Preferences)
3. Click "Profiles" in the sidebar
4. Select "Pro" theme
5. Click "Default" at the bottom to make it your default

In the "Window" tab, set:
- Columns: 200
- Rows: 50

Quit and restart Terminal to see the changes.

### Pin Apps to Your Dock

Right-click on any app icon in the Dock and choose Options > Keep in Dock.

Recommended apps to pin:
- Terminal
- VS Code
- Finder
- Your web browser

---

## Verification

Let's make sure everything is working!

### Check Git

```bash
git --version
```
Should show: `git version 2.x.x`

### Check GitHub CLI

```bash
gh auth status
```
Should show: `Logged in to github.com as YOUR_USERNAME`

### Check Homebrew

```bash
brew --version
```
Should show: `Homebrew 4.x.x`

### Check VS Code

```bash
code --version
```
Should show a version number

### Check Node (if installed)

```bash
node -v
```
Should show: `v20.x.x`

### Check Ruby (if installed)

```bash
ruby -v
```
Should show: `ruby 3.3.x`

---

## Quick Reference: Useful Commands

Here are some commands you'll use often:

| Command | What It Does |
|---------|--------------|
| `cd ~/code` | Go to your code folder |
| `cd ..` | Go up one folder |
| `ls` | List files in current folder |
| `ls -la` | List all files including hidden ones |
| `pwd` | Show current folder path |
| `code .` | Open current folder in VS Code |
| `git status` | See what files have changed |
| `git pull` | Get latest changes from GitHub |
| `git push` | Upload your changes to GitHub |
| `brew update` | Update Homebrew |
| `brew upgrade` | Upgrade installed packages |

---

## Troubleshooting

### "Command not found" Errors

If you see "command not found" for something you just installed, try:
```bash
exec zsh
```
This reloads your terminal configuration.

### Permission Errors

If you see "Permission denied" errors, you might need to use `sudo`:
```bash
sudo [your command]
```
Then enter your Mac password.

### Homebrew Issues

If Homebrew is acting up:
```bash
brew doctor
```
This will tell you what's wrong and often how to fix it.

### Need to Start Over?

If your terminal is in a weird state, just quit it (`Cmd + Q`) and open a new one.

---

## Keeping Things Updated

Every few weeks, run these commands to keep your tools up to date:

```bash
brew update && brew upgrade
```

---

## Congratulations!

Your Mac is now set up as a development environment! You have:

- A beautiful, powerful Terminal with Oh My Zsh
- Git and GitHub CLI for version control
- VS Code for editing code
- Your personal dotfiles configuration
- Homebrew for installing future tools

Happy coding!
