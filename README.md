# Brain Extraction (FSL BET)

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Skull-strips a T1-weighted image with FSL BET, with optional robust centre estimation (-R) or bias-field and neck cleanup (-B), and outputs the brain-extracted T1w.**

Runs FSL BET (via brain_extract.py inside brainlife/fsl:6.0.4-patched2) on a T1w volume. Lower frac gives a larger brain mask; use robust for unusual head shapes and bias_neck_cleanup for images with strong bias or a lot of neck. Use it when you need a brain-only T1w for registration or segmentation.

| | |
|---|---|
| 📥 **Inputs** | `neuro/anat/t1w` |
| 📤 **Outputs** | `neuro/anat/t1w` |
| 🐳 **Container** | `brainlife/fsl:6.0.4-patched2` |
| ⚙️ **Resources** | 4 GB memory · 1 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.1000](https://doi.org/10.25663/brainlife.app.1000) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` | yes | T1-weighted anatomical image to skull-strip. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `t1_brain` | `neuro/anat/t1w` | Brain-extracted T1w volume produced by FSL BET. |

<details>
<summary><b>⚙️ Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `frac` | number | `0.5` | BET fractional intensity threshold (0–1). Lower values give a larger brain mask. |
| `robust` | boolean | `false` | Use robust brain centre estimation (-R). Slower but more reliable for unusual head shapes. |
| `bias_neck_cleanup` | boolean | `false` | Bias-field correction + neck cleanup (-B). |

</details>

<!-- brainlife-app:end -->

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
