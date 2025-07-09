#!/bin/bash

# Build Debug Script for SALSA Project
echo "🔍 Debugging SALSA Build Process..."

# Check Node and npm versions
echo "📋 Environment Info:"
echo "Node: $(node --version)"
echo "npm: $(npm --version)"
echo "OS: $(uname -s)"

# Check if package.json exists
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found!"
    exit 1
fi

# Display package.json build script
echo "📦 Build Script:"
cat package.json | grep -A 5 -B 5 '"build"'

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "⚠️  node_modules not found. Installing dependencies..."
    npm install
fi

# Check critical dependencies
echo "🔍 Checking Critical Dependencies:"
npm list vite @vitejs/plugin-react react react-dom --depth=0 2>/dev/null || echo "⚠️  Some dependencies missing"

# Clean build
echo "🧹 Cleaning previous builds..."
rm -rf dist/ .vite/

# Attempt build with verbose output
echo "🔨 Building project..."
npm run build 2>&1 | tee build.log

# Check if build succeeded
if [ -d "dist" ] && [ -f "dist/index.html" ]; then
    echo "✅ Build successful!"
    echo "📁 Build output:"
    ls -la dist/
    echo "📄 index.html content:"
    head -n 20 dist/index.html
else
    echo "❌ Build failed!"
    echo "📄 Build log:"
    cat build.log
    exit 1
fi

# Test the build
echo "🧪 Testing build..."
npm run start &
SERVER_PID=$!
sleep 5
curl -f http://localhost:4173 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Build test successful!"
else
    echo "⚠️  Build test failed - server may not be running"
fi
kill $SERVER_PID 2>/dev/null

echo "🎉 Build debug complete!"
