# Deploy to BioWell.ai (Netlify)

This guide will help you deploy your SALSA project to your biowell.ai domain via Netlify.

## Prerequisites

1. **Netlify Account**: Make sure you have a Netlify account linked to your GitHub repository
2. **Domain Setup**: Your biowell.ai domain should be configured in your Netlify site settings
3. **Environment Variables**: Set up the following environment variables in your Netlify dashboard:
   - `NODE_VERSION`: 18
   - `FRONTEND_ENDPOINT`: <https://biowell.ai>
   - `NODE_ENV`: production

## Quick Deploy

### Option 1: Automated Script

```bash
./deploy-to-netlify.sh
```

### Option 2: Manual Steps

```bash
# Build the project
npm run build

# Deploy using Netlify CLI
npx netlify deploy --prod --dir=dist
```

## First-Time Setup

If this is your first deployment, follow these steps:

1. **Login to Netlify**:

   ```bash
   npx netlify login
   ```

2. **Initialize your site**:

   ```bash
   npx netlify init
   ```

   - Choose "Create & configure a new site"
   - Select your team
   - Enter site name: `biowell-ai`
   - Choose build command: `npm run build`
   - Choose publish directory: `dist`

3. **Link your custom domain**:
   - Go to your Netlify dashboard
   - Navigate to Site settings > Domain management
   - Add your custom domain: `biowell.ai`
   - Configure DNS settings as instructed

## Build Configuration

The project uses Vite for building and includes:

- **Build command**: `npm run build`
- **Publish directory**: `dist`
- **Node version**: 18
- **Redirects**: Configured for SPA routing
- **Headers**: Security headers enabled

## Environment Variables

Set these in your Netlify dashboard under Site settings > Environment variables:

```
NODE_VERSION=18
FRONTEND_ENDPOINT=https://biowell.ai
NODE_ENV=production
```

## Continuous Deployment

Once set up, every push to the main branch will automatically trigger a deployment to biowell.ai.

## Manual Deployment Commands

```bash
# Development preview
npx netlify deploy --dir=dist

# Production deployment
npx netlify deploy --prod --dir=dist

# Check deployment status
npx netlify status
```

## Troubleshooting

### Build Fails

- Check that all dependencies are installed: `npm install`
- Verify build works locally: `npm run build`
- Check Node version matches (18): `node --version`

### Deployment Fails

- Ensure you're logged in: `npx netlify login`
- Check site is linked: `npx netlify status`
- Verify publish directory exists: `ls -la dist/`

### Domain Issues

- Verify DNS settings in Netlify dashboard
- Check domain configuration in Site settings
- Ensure SSL certificate is provisioned

## Support

For issues specific to Netlify deployment, check:

- [Netlify Documentation](https://docs.netlify.com/)
- [Build troubleshooting](https://docs.netlify.com/configure-builds/troubleshooting-tips/)
- [Custom domain setup](https://docs.netlify.com/domains-https/custom-domains/)
