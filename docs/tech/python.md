# Python

## How-to


### file and directories

```python title="mkdir"
Path.mkdir(parents=True, exist_ok=True) # parents=True: mkdir -p, exist_ok: ignore error if folder exist
```

```python title="copy files or folder"
import shutil

shutil.copyfile(src, dst)

# 2nd option
shutil.copy(src, dst)  # dst can be a folder; use shutil.copy2() to preserve timestamp
```
via: https://stackoverflow.com/a/123212/644070
