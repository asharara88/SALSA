#!/bin/bash
# Navigate to SALSA project directory
# This script ensures you're always in the correct project directory

echo "🚀 Navigating to SALSA project directory..."
cd /Users/ahmedsharara/SALSA

if [ $? -eq 0 ]; then
    echo "✅ Successfully navigated to: $(pwd)"
    echo "📊 Git status:"
    git status --short
    echo ""
    echo "🎯 Available commands:"
    echo "  npm run dev     - Start development server"
    echo "  npm run build   - Build for production"
    echo "  git status      - Check git status"
    echo "  git add .       - Stage all changes"
    echo "  git commit -m   - Commit changes"
    echo "  git push        - Push to remote"
else
    echo "❌ Failed to navigate to SALSA directory"
fi
