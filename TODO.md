# Remaining Chapter Fixes

Chapters that are enabled in `_toc.yml` but fail during book build.

## dl/Equivariant
- **Error**: `No module named 'haiku'`
- **Fix**: Port from dm-haiku to flax.linen (same pattern as dl/xai)

## dl/VAE
- **Error**: `jax.random.shuffle` removed in JAX 0.9
- **Fix**: Replace `jax.random.shuffle` with `jax.random.permutation`

## applied/MolGenerator
- **Error**: `'Functional' object has no attribute 'reset_states'` (Keras API change)
- **Fix**: Update stateful inference model for TF 2.20 Keras API

## applied/e3nn_traj
- **Error**: `No module named 'torch_geometric'`
- **Fix**: Add `torch_geometric` to dependencies, or rework to avoid it

## dl/pretraining
- **Error**: `No module named 'simpletransformers'`
- **Fix**: Add `simpletransformers` to dependencies, or rework

## dl/xai
- **Error**: `list index out of range` (intermittent, in exmol)
- **Fix**: Investigate flaky exmol `sample_space` — may need a try/except or seed fix

## Excluded chapters (not in _toc.yml)
- `dl/Hyperparameter_tuning` — out of date, intentionally excluded
- `dl/molnets` — in progress, intentionally excluded
