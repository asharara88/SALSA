#!/bin/bash

# Deploy to Netlify Script for BioWell.ai
echo "🚀 Deploying SALSA to biowell.ai via Netlify..."

# Check if Netlify CLI is installed
if ! command -v netlify &> /dev/null; then
    echo "📦 Installing Netlify CLI..."
    npm install -g netlify-cli
fi

# Clean install dependencies
echo "🧹 Cleaning and installing dependencies..."
rm -rf node_modules package-lock.json
npm install

# Build the project
echo "🔨 Building the project..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    
    # Check if dist directory exists and has content
    if [ -d "dist" ] && [ "$(ls -A dist/)" ]; then
        echo "📁 Build output verified in dist/"
        
        # Deploy to Netlify
        echo "🌐 Deploying to Netlify..."
        
        # Production deployment
        npx netlify deploy --prod --dir=dist --site=biowell-ai
        
        if [ $? -eq 0 ]; then
            echo "🎉 Successfully deployed to biowell.ai!"
            echo "🔗 Your site is live at: https://biowell.ai"
        else
            echo "❌ Deployment failed. Please check your Netlify configuration."
            echo "💡 Make sure you're logged in with: npx netlify login"
            echo "💡 And that your site is linked with: npx netlify link"
        fi
    else
        echo "❌ Build output directory is empty or missing"
    fi
else
    echo "❌ Build failed. Please fix the errors and try again."
    echo "🔍 Run ./build-debug.sh for more details"
fi
