# Reproducible example: jupytext fails to preserve tags when outputting MyST.

To reproduce, just run these commands (as of 2022-01-17), or run `repro.sh`,
which does the same thing:

```
python3 -m venv --symlinks --upgrade-deps test-venv
source test-venv/bin/activate
pip install jupytext
pip freeze > versions.txt
jupytext --to md:myst ./example.ipynb

cat ./example.md
```

The `example.ipynb` file in this repository contains a code cell and a markdown cell.
The markdown cell has the tag `"remove-cell"`. You can verify this by inspecting the
json or by loading the ipynb file in a jupyter client.

However, when jupytext converts this notebook to MyST, the code cell's tag is lost. The
MyST markdown output should either have a `:tags:` role at the beginning of the cell, or
a json block `---` with tags metadata. But as you can see by running the above, it has
nothing; no metadata, no tags. This also means that jupytext will strip all tags from
MyST markdown files (e.g. if they were written into the file by hand) when syncing with
other formats.

I've included my `versions.txt` from the last time I ran these commands, so that you can
diff against any upstream version changes in the meantime.
