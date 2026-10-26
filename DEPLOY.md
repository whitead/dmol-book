# Deploying dmol.pub

## Deploy

Deployments are manual via GitHub Actions. Merge changes into `main` before
deploying; the workflow builds the ref selected when it is run.

1. Go to **Actions** > **deploy-book** > **Run workflow** (or use the CLI):

   ```bash
   gh workflow run deploy-jupyter-book.yml --ref main
   ```

2. Wait for the **deploy-book** workflow to finish. It builds the book, pushes
   `_build/html` to `gh-pages`, and triggers a GitHub Pages build.
3. Check the updated page at [dmol.pub](https://dmol.pub).

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
gh workflow run publish-package.yml --ref main
```

This builds and uploads the `dmol-book` package to PyPI using the
`PYPI_API_TOKEN` repository secret.
