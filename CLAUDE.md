# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Deep Learning for Molecules and Materials Book** (dmol.pub), a Jupyter Book-based educational resource covering deep learning applications in chemistry and materials science. The book uses Python with Jax, Keras, TensorFlow, and scikit-learn, teaching concepts through interactive Jupyter notebooks.

## Project Status

We are working on version two in a branch. The goal right now is to update all examples to replace tensorflow with pytroch.

We are working with the following strategy:

* work down the `_toc.yml` file one by one by uncommenting
* build the book, observe errors in the most recently uncommented chapter
* fix the errors, trying to keep the examples as close to text/tensorflow examples
* commit as each cell is passing
* ensure the text is consistent with the modifications

The style of the code is to be "self-documenting," so avoid excessive comments in the code and strive for simplicity and idiomatic code (i.e., focus on normal examples of pytorch rather than exact ports of tensorflow code).

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
- Book configuration excludes certain directories from build (`dl/*`, `applied/*`, `data/*` currently excluded in `_config.yml`)
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
- Includes intersphinx mappings for external documentation (TensorFlow, JAX, NumPy, etc.)
- TODO: Remove Tensorflow at end, and start linking to PyTorch
- MyST extensions enabled: amsmath, colon_fence, dollarmath, linkify, substitution

## Dependencies

Core dependencies (see `package/pyproject.toml`):
- jupyter-book, matplotlib, numpy, jax, jaxlib
- pandas, seaborn, scikit-learn
- rdkit, e3nn, torch, selfies, exmol
- MDAnalysis, networkx, mordredcommunity
- torch (may be required to add)

Requires Python >= 3.12
