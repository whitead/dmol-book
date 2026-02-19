# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Deep Learning for Molecules and Materials Book** (dmol.pub), a Jupyter Book-based educational resource covering deep learning applications in chemistry and materials science. The book uses Python with JAX, PyTorch, and scikit-learn, teaching concepts through interactive Jupyter notebooks.

## Project Status

We are porting version two from TensorFlow/Keras to PyTorch on the `v2` branch.

### Strategy

* Work down the `_toc.yml` file one by one by uncommenting chapters
* Build the book, observe errors in the most recently uncommented chapter
* Fix the errors, keeping the narrative close to the original text
* Commit as each cell is passing
* Ensure the text is consistent with the code modifications
* Update pseudocode snippets in markdown cells to use PyTorch syntax

### Porting Progress

**Completed (in `_toc.yml`, building):**
- `math/tensors-and-shapes` — no TF code, already fine
- `ml/introduction`, `ml/regression`, `ml/classification`, `ml/kernel` — no TF code, already fine
- `dl/introduction` — ported to PyTorch
- `dl/layers` — ported to PyTorch
- `dl/gnn` — ported to PyTorch
- `dl/data` — no TF code, fixed moviepy compat
- `dl/xai` — replaced Haiku with Flax Linen, ported Keras model to PyTorch, removed TF

**Next up (commented out in `_toc.yml`, need porting):**
- `dl/Equivariant` — no TF code; needs uncommenting and testing
- `dl/attention` — no TF code; needs uncommenting and testing
- `dl/NLP` — 10 TF refs in code, needs porting
- `dl/VAE` — no TF code; needs uncommenting and testing
- `dl/flows` — 8 TF refs (uses tensorflow_probability), needs porting
- `applied/QM9` — 1 TF ref, needs porting
- `applied/MolGenerator` — 17 TF refs, needs porting
- `dl/Hyperparameter_tuning` — 26 TF refs, needs porting
- `applied/e3nn_traj` — already uses PyTorch/e3nn, just needs uncommenting
- `dl/pretraining` — no TF code; needs uncommenting and testing

The style of the code is to be "self-documenting," so avoid excessive comments and strive for simplicity and idiomatic PyTorch (not exact ports of TensorFlow code).

## Repository Structure

- `math/` - Part A: Math Review chapters (tensors, shapes)
- `ml/` - Part B: Machine Learning chapters (introduction, regression, classification, kernel methods)
- `dl/` - Part C: Deep Learning chapters (introduction, layers, GNN, etc.)
- `applied/` - Part D: Application examples (QM9, molecule generation)
- `package/dmol/` - Python package for styling and imports used throughout notebooks
- `_toc.yml` - Table of contents defining book structure
- `_config.yml` - Jupyter Book configuration
- `references.bib` - Bibliography for citations

## Development Commands

### Building the Book

```bash
# Build the book locally
jupyter-book build .

# Output will be in _build/html/
# Open _build/html/index.html to view
```

### Pre-commit Hooks

```bash
# Install pre-commit hooks (one-time setup)
pip install -r dev-requirements.txt
pre-commit install

# Run pre-commit manually on all files
pre-commit run --all
```

The pre-commit hooks include:
- **nbstripout**: Strips output from Jupyter notebooks
- **black**: Python code formatting
- **trailing-whitespace**, **end-of-file-fixer**, **mixed-line-ending**: File cleanup

### Python Environment

```bash
source .venv/bin/activate
```

## Working with Content

### Jupyter Notebooks

All instructional content is in Jupyter notebooks (`.ipynb` files). When working with notebooks:

- The `dmol` package is imported at the start of most notebooks to set up plotting styles and configurations
- Notebooks execute with force execution (`execute_notebooks: force` in `_config.yml`)
- Output is stripped by nbstripout before committing
- Chapters are enabled by uncommenting them in `_toc.yml` and removing them from `exclude_patterns` in `_config.yml`
- Some notebooks contain cells marked "YOU CAN SKIP IT" that generate figures/animations for the book (e.g., using moviepy). These cells are for book building only - students working through notebooks do not need to run them. However, moviepy must be installed for the book build to succeed.

### Style Guidelines (from style.md)

- Import `dmol` package at the start of notebooks for consistent plot styling
- Use `{cite}` for citations: `This is a citation{cite}`foo2020`.`
- Use bordered boxes (tips/warnings) sparingly for critical notes
- Right-column notes are for supplementary information, not essential reading

## Git Workflow

Main branch: `main`
Current branch: `v2`

When committing:
- Pre-commit hooks will automatically format code and clean up files
- Notebooks will have outputs stripped automatically
- If pre-commit makes changes, stage them and commit again
- **IMPORTANT**: Always review `git status` before committing. Only commit files you intentionally modified.
- **Do not commit** generated files like:
  - Font files (*.ttf)
  - Data files (*.npz, *.csv, *.pb.gz) unless explicitly required
  - Build artifacts (_build/*)
  - Generated images unless they're part of the source content

## Key Architecture Notes

### The dmol Package

Located in `package/dmol/__init__.py`, this package:
- Configures matplotlib with custom fonts (Courier Prime) and color schemes
- Sets up RDKit for molecular visualization (SVG output, BW atom palette)
- Sets random seeds for reproducibility
- Applies consistent styling across all book visualizations

### Book Configuration

- Uses Jupyter Book 1.0.4
- Executes notebooks with unlimited timeout (`timeout: -1`)
- Configured for interactive launch via Google Colab
- Includes intersphinx mappings for external documentation
- TODO: Replace TensorFlow intersphinx mapping with PyTorch when migration is complete
- MyST extensions enabled: amsmath, colon_fence, dollarmath, linkify, substitution

## Dependencies

Core dependencies (see `package/pyproject.toml`):
- jupyter-book, matplotlib, numpy, jax, jaxlib
- pandas, seaborn, scikit-learn
- rdkit, e3nn, torch, selfies, exmol
- MDAnalysis, networkx, mordredcommunity
- moviepy (for book-building animations)

Requires Python >= 3.12
