# Remaining Chapter Fixes

Chapters that are enabled in `_toc.yml` but fail during book build.

## dl/xai
- **Error**: `list index out of range` (intermittent, in exmol)
- **Status**: Could not reproduce. Executed successfully in testing. May be transient.

## Excluded chapters (not in _toc.yml)
- `dl/Hyperparameter_tuning` — out of date, intentionally excluded
- `dl/molnets` — in progress, intentionally excluded

## Fixed

- `dl/Equivariant` — removed unused `haiku` / `emlp.nn.haiku` imports (emlp.nn.EMLP uses objax, not haiku)
- `dl/VAE` — replaced `jax.random.shuffle` with `jax.random.permutation`
- `applied/MolGenerator` — fixed `reset_states()` for Keras 3 (call on GRU layer, not model); wrapped tensorflowjs export in try/except
- `applied/e3nn_traj` — added `torch_geometric` to dependencies
- `dl/pretraining` — ported from `simpletransformers` to HuggingFace `transformers` (Trainer API)
- `dl/VAE`, `dl/data`, `dl/gnn` — updated moviepy imports for v2 (`from moviepy import VideoClip`, local `mplfig_to_npimage` helper)
- `dl/VAE` — fixed `set_data()` calls to pass sequences (matplotlib compat)
