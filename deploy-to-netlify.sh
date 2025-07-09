#!/bin/bash

# Deploy to Netlify Script for BioWell.ai
echo "🚀 Deploying SALSA to biowell.ai via Netlify..."

# Check if Netlify CLI is installed
if ! command -v netlify &> /dev/null; then
    echo "📦 Installing Netlify CLI..."
    npm install -g netlify-cli
fi

# Build the project
echo "🔨 Building the project..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    
    # Deploy to Netlify
    echo "🌐 Deploying to Netlify..."
    
    # Production deployment
    netlify deploy --prod --dir=dist --site=biowell-ai
    
    if [ $? -eq 0 ]; then
        echo "🎉 Successfully deployed to biowell.ai!"
        echo "🔗 Your site is live at: https://biowell.ai"
    else
        echo "❌ Deployment failed. Please check your Netlify configuration."
        echo "💡 Make sure you're logged in with: netlify login"
        echo "💡 And that your site is linked with: netlify link"
    fi
else
    echo "❌ Build failed. Please fix the errors and try again."
fi
