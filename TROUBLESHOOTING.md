# 🚨 Deployment Troubleshooting Guide

## Common Deployment Issues & Solutions

### 1. **Build Failures**

#### Symptoms:

- Netlify build fails with dependency errors
- "Module not found" errors
- TypeScript compilation errors

#### Solutions:

```bash
# Clean install dependencies
rm -rf node_modules package-lock.json
npm install

# Run debug script
./debug-build.sh

# Test build locally
npm run build
```

### 2. **GitHub Actions Failures**

#### Missing Secrets:

Add these secrets in GitHub repository settings:

- `NETLIFY_AUTH_TOKEN`: Get from Netlify dashboard
- `NETLIFY_SITE_ID`: Get from Netlify site settings
- `BIOWELL_API_KEY`: Your BioWell API key
- `FRONTEND_API_KEY`: Frontend API key

#### Action Steps:

1. Go to GitHub repository → Settings → Secrets and variables → Actions
2. Add each secret with the correct value
3. Re-run failed workflows

### 3. **Netlify Configuration Issues**

#### Fix netlify.toml:

```toml
[build]
  command = "npm ci && npm run build"
  publish = "dist"

[build.environment]
  NODE_VERSION = "18"
  CI = "true"
```

#### Environment Variables in Netlify:

- `NODE_VERSION`: 18
- `NODE_ENV`: production
- `FRONTEND_ENDPOINT`: https://biowell.ai

### 4. **Node.js Version Issues**

#### Create .nvmrc:

```
18
```

#### Update package.json:

```json
{
  "engines": {
    "node": ">=18.0.0",
    "npm": ">=8.0.0"
  }
}
```

### 5. **React/Vite Build Issues**

#### Check vite.config.ts:

```typescript
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  build: {
    outDir: "dist",
    sourcemap: false,
    rollupOptions: {
      external: [],
    },
  },
});
```

### 6. **Deployment Verification**

#### Test deployment:

```bash
# Local build test
npm run build
npm run start

# Check if site is accessible
curl -f https://biowell.ai

# Check build output
ls -la dist/
```

## 🔧 Quick Fix Commands

```bash
# Complete reset and redeploy
rm -rf node_modules package-lock.json dist/
npm install
npm run build
git add .
git commit -m "🔧 Fix deployment issues"
git push origin main

# Debug build issues
./debug-build.sh

# Check GitHub Actions logs
gh run list
gh run view [run-id]
```

## 📞 Getting Help

1. **Check build logs** in Netlify dashboard
2. **Review GitHub Actions** workflow runs
3. **Run debug script** locally: `./debug-build.sh`
4. **Test build locally** before pushing

## 🚀 Deployment Checklist

- [ ] Dependencies installed (`npm ci`)
- [ ] Build works locally (`npm run build`)
- [ ] GitHub secrets configured
- [ ] Netlify environment variables set
- [ ] Node version 18 specified
- [ ] No TypeScript errors
- [ ] All files committed and pushed
