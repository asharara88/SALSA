#!/bin/bash

echo "🧹 Cleaning up Git repositories in home directory..."

# Navigate to home directory
cd /Users/ahmedsharara

# Remove VS Code's remote repository cache git repos (safe to remove)
echo "Removing VS Code cache git repositories..."
rm -rf "./Library/Application Support/Code/User/globalStorage/github.remotehub/*/changestore/vscode-vfs-github*/asharara88/SALSA/.git"

# Remove duplicate project git repos (keeping only the main SALSA one)
echo "Removing duplicate SALSA repositories..."
if [ -d "./SALSA-1/.git" ]; then
    echo "Removing SALSA-1 git repository..."
    rm -rf "./SALSA-1/.git"
fi

# Check for any other git repos in home (but don't auto-remove)
echo "Checking for other git repositories..."
find . -maxdepth 2 -name ".git" -type d 2>/dev/null | grep -v "./SALSA/.git" | head -10

# Navigate back to main SALSA directory
cd /Users/ahmedsharara/SALSA

echo "✅ Cleanup complete!"
echo "📍 Current directory: $(pwd)"
echo "📊 SALSA repository status:"
git status --porcelain | wc -l | xargs echo "Files with changes:"
git log --oneline | wc -l | xargs echo "Total commits:"
