# Contributing Docs

## Building Slides

The easiest way to turn notebooks into slides is with `make slides`.
- That command calls the `generate_slides.sh` script in `scripts`, which uses `nbconvert` to turn each notebook into an HTML file of slides in the `slides` directory.
- It also copies over the contents of the `images` directory, from the `notebooks` folder into `slides`, so that image references still work.

If you want to just build slides for a single notebook, you can call `nbconvert` directly, though you need to `cd` into the `notebooks` directory first.
```bash
jupyter nbconvert --to slides <notebookname.ipynb> --output-dir=../slides
```

## CI Overview

All ipynb files in the `notebooks` directory are run through Papermill (in GitHub Actions) to make sure they don't have errors.

However, sometimes it's *useful* to include a code call that results in an error -- to demonstrate a sample exception, or to show why a certain approch is wrong.
To do that without breaking CI, add a metadata tag `ci-skip` to the code cell.
Cells with this tag are automatically removed from the notebook before CI runs (via the `prep_nb_for_ci.py` script.
