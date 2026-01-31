# Claude Code Setup Guide

Instructions for setting up Claude Code on a new machine.

---

## Prerequisites

- [ ] VS Code installed
- [ ] Claude Code VS Code extension installed (search "Claude Code" in extensions)
- [ ] Claude Code CLI available (`claude --version` to verify)

---

## Step 1: Ensure dotfiles are cloned

```bash
# If not already cloned
git clone git@github.com:dujaje/dotfiles.git ~/Documents/code/dujaje/dotfiles
```

---

## Step 2: Create ~/.claude directory

```bash
mkdir -p ~/.claude
```

---

## Step 3: Symlink universal CLAUDE.md

```bash
# Remove existing file if present
rm -f ~/.claude/CLAUDE.md

# Create symlink to dotfiles version
ln -s ~/Documents/code/dujaje/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
```

---

## Step 4: Add MCP Servers

Add your universal MCP servers (available in all projects):

```bash
# Craft (personal note-taking)
claude mcp add --transport http craft-docs --scope user https://mcp.craft.do/links/JFiJbWF7lcT/mcp

# Add other universal MCPs here as needed
```

---

## Step 5: Verify Setup

1. Open any project in VS Code
2. Start Claude Code
3. Ask: "What's in my universal CLAUDE.md?"
4. Verify your preferences are loaded

---

## MCP Servers Reference

| Name | Purpose | Command |
|------|---------|---------|
| craft-docs | Personal note-taking | `claude mcp add --transport http craft-docs --scope user https://mcp.craft.do/links/JFiJbWF7lcT/mcp` |

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
claude mcp add --transport http craft-docs --scope user https://mcp.craft.do/links/JFiJbWF7lcT/mcp
```

---

*Last updated: January 2026*
