# Brain Extraction (FSL BET)

Skull-strip a T1w volume using FSL BET. Supports robust centre estimation (-R) and bias-field + neck cleanup (-B).

## Inputs

- `t1` (neuro/anat/t1w)

## Outputs

- `t1_brain` (neuro/anat/t1w) -- Brain-extracted T1w volume produced by FSL BET.

## Usage

Brainlife.io: run via `faber-app-run`/`faber-app-pipeline` (once registered
with `faber-app-create`), or the web UI.

Locally (outside brainlife): copy `config.json.example` to `config.json`,
fill in real file paths, then run `./main` from this directory. `main` pulls
its own container (`singularity exec docker://...`) -- no local install of
the underlying tool needed, only Singularity itself.

Entrypoint: `run_bet.sh`

## Authors

- Gabriele Amorosino <gamorosino@gmail.com>

#### MIT Copyright (c) 2026 Gabriele Amorosino
