# Repository guidance

## Project

This repository builds the [Deep Learning for Molecules and Materials](https://dmol.pub)
Jupyter Book. `main` is the active branch and the base for pull requests.

## Source and generated files

- `_toc.yml` lists the published chapters; `_config.yml` configures the book.
- Chapter source lives in `math/`, `ml/`, `dl/`, and `applied/`, mostly as
  Jupyter notebooks. Shared styles and images live in `_static/`.
- The `dmol-book` Python package and book dependencies are in `package/`.
- `_build/` is generated output. Edit source files and do not commit build
  output or notebook-generated data files unless they are intentionally part
  of the source.

## Validation

- CI uses Python 3.13 and installs the local package with `pip install -e package/`.
  The package requires Python 3.12 or newer.
- Run `pre-commit run --all-files` for formatting and notebook output checks.
- Run `jupyter-book build -n .` for the same no-execution structure build used
  by the pull request check. `jupyter-book build .` executes notebooks and
  builds the full site in `_build/html/`.
- Review `git status` before committing so local build artifacts and data do
  not enter a pull request.

## Publishing

The book and package publishing workflows are manually dispatched from
`main`. Follow [DEPLOY.md](DEPLOY.md) to deploy the book or publish the package.
Opening or merging a pull request does not deploy the site.
