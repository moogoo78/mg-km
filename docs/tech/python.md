# Python

## How-to

```python title="copy files/folders"
import shutil

shutil.copyfile(src, dst)

# 2nd option
shutil.copy(src, dst)  # dst can be a folder; use shutil.copy2() to preserve timestamp
```
via: https://stackoverflow.com/a/123212/644070
