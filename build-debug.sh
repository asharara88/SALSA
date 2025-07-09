#!/bin/bash

# Build Debug Script for Netlify
echo "🔍 Checking build environment..."

# Check Node version
echo "Node version: $(node --version)"

# Check npm version
echo "npm version: $(npm --version)"

# Check if vite is installed
echo "Checking for vite..."
if npm list vite; then
    echo "✅ Vite is installed"
else
    echo "❌ Vite is not installed"
    echo "Installing vite..."
    npm install -D vite
fi

# Check if build command exists
echo "Checking build script..."
if npm run build --dry-run 2>/dev/null; then
    echo "✅ Build script exists"
else
    echo "❌ Build script not found"
fi

# List installed packages
echo "📦 Installed packages:"
npm list --depth=0

# Check if dist directory exists after build
echo "🔨 Testing build..."
npm run build

if [ -d "dist" ]; then
    echo "✅ Build successful - dist directory created"
    echo "📁 Contents of dist:"
    ls -la dist/
else
    echo "❌ Build failed - no dist directory"
fi
