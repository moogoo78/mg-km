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

## Issues

函式預設輸入值如果是 `list`、`dictionary`、`instance of most classes` (mutable object)，在函式定義的時候就建立了，之後載呼叫同一個函式會持續保留裡面的數值。

ref:
- chatGPT: https://chat.openai.com/share/4be34b81-3eb6-4d99-99cf-20881e2fc831
- python docs: https://docs.python.org/3/tutorial/controlflow.html#default-argument-values

## Packages

### PIL, PILLOW

`Image.ANTIALIAS` 新版改成 `Image.Resampling.LANCZOS`
