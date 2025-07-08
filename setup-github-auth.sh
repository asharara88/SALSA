#!/bin/bash

# GitHub Authentication Setup Script
# This script helps set up GitHub authentication for the SALSA repository

echo "🔐 Setting up GitHub authentication for SALSA repository..."

# Check current authentication status
echo "📊 Current GitHub CLI authentication status:"
gh auth status

echo ""
echo "🔑 Options for authentication:"
echo "1. Use Personal Access Token (recommended)"
echo "2. Set up SSH keys"
echo "3. Re-authenticate with GitHub CLI"

read -p "Choose an option (1-3): " choice

case $choice in
    1)
        echo "📝 Creating a Personal Access Token..."
        echo "Please follow these steps:"
        echo "1. Go to https://github.com/settings/tokens"
        echo "2. Click 'Generate new token' -> 'Generate new token (classic)'"
        echo "3. Select these scopes: repo, workflow, read:org"
        echo "4. Copy the token and paste it when prompted"
        echo ""
        gh auth login --scopes "repo,workflow,read:org"
        ;;
    2)
        echo "🔑 Setting up SSH keys..."
        ssh-keygen -t ed25519 -C "asharara88@users.noreply.github.com" -f ~/.ssh/id_ed25519
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519
        echo ""
        echo "📋 Your public key (copy this to GitHub):"
        cat ~/.ssh/id_ed25519.pub
        echo ""
        echo "Add this key to your GitHub account at: https://github.com/settings/keys"
        read -p "Press Enter after adding the key to GitHub..."
        
        # Switch remote to SSH
        cd /Users/ahmedsharara/SALSA
        git remote set-url origin git@github.com:asharara88/SALSA.git
        echo "✅ Switched to SSH authentication"
        ;;
    3)
        echo "🔄 Re-authenticating with GitHub CLI..."
        gh auth logout
        gh auth login --scopes "repo,workflow,read:org"
        ;;
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac

echo ""
echo "🧪 Testing authentication..."
cd /Users/ahmedsharara/SALSA
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Authentication successful! Your changes have been pushed."
else
    echo "❌ Authentication failed. Please try again or contact support."
fi
