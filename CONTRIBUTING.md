# Contributing Docs

## Building Slides

The easiest way to turn notebooks into slides is with `make slides`.
- That command calls the `generate_slides.sh` script in `scripts`, which uses `nbconvert` to turn each notebook into an HTML file of slides in the `slides` directory.
- It also copies over the contents of the `images` directory, from the `notebooks` folder into `slides`, so that image references still work.

If you want to just build slides for a single notebook, you can call `nbconvert` directly, though you need to `cd` into the `notebooks` directory first.
```bash
jupyter nbconvert --to slides <notebookname.ipynb> --output-dir=../slides
```

## Notebook Naming Convention

In order to keep notebooks ordered, we prefix them with a 2-digit "code" indicating where in the sequence they fall.
For example, the first notebook we cover is `00-Intro.ipynb`.
The twelfth notebook would have a name starting with `12-`.

This convention is expected by the `generate_slides.sh` script as well; only notebooks matching `*-*.ipynb` will be converted to slides.
Helpfully though, this means that you can keep scratch notebooks in the `notebooks` directory as long as they don't have dashes in their names.

## CI Overview

In GitHub Actions, all ipynb files in the `notebooks` directory are run through Papermill to make sure they don't have errors.

However, sometimes it's *useful* to include a code call that results in an error -- to demonstrate a sample exception, or to show why a certain approch is wrong.
To do that without breaking CI, add a metadata tag `ci-skip` to the code cell.
Cells with this tag are automatically removed from the notebook before CI runs (via the `prep_nb_for_ci.py` script).
