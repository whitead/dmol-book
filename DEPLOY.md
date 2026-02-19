# Deploying dmol.pub

## Deploy

Deployments are manual via GitHub Actions:

1. Go to **Actions** > **deploy-book** > **Run workflow** (or use the CLI):

   ```bash
   gh workflow run deploy-jupyter-book.yml --ref v2
   ```

2. The workflow builds the book and pushes the result to the `gh-pages` branch. The site at dmol.pub updates automatically via GitHub Pages.

## Rollback

Because `force_orphan` is off, the `gh-pages` branch keeps full commit history. To roll back a bad deploy:

1. Find the last good commit on `gh-pages`:

   ```bash
   git log origin/gh-pages --oneline
   ```

2. Reset `gh-pages` to that commit and force-push:

   ```bash
   git checkout gh-pages
   git reset --hard <good-commit-sha>
   git push --force origin gh-pages
   ```

3. The site will revert within a few minutes.

## Publish the `dmol-book` package

Package publishing is a separate workflow:

```bash
gh workflow run publish-package.yml --ref v2
```

This builds and uploads the `dmol-book` package to PyPI using trusted publishing.
