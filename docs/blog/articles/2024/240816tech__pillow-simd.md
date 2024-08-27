---
date: 2024-08-16
title: Python 製作縮圖 (Pillow/PIL)
categories:
  - Tech
tags:
  - multimedia
  - python
---

# Python 製作縮圖 (Pillow/PIL)

[Pillow (PIL Fork) 10.4.0 documentation](https://pillow.readthedocs.io/en/stable/)

Usage:

```python title="Read image and make thumbnails"
thumb = Image.open(img)
thumb.thumbnail(i[1] , Image.LANCZOS)
# thumb = thumb.convert('RGB')
thumb.save(target_path, "JPEG")
thumb.close()
```

演算法可以參考下圖。
![Compare Filters](../../../assets/blog/pillow-compare-filters.png)

screenshot via: [Filters](https://pillow.readthedocs.io/en/stable/handbook/concepts.html#concept-filters)

## Pillow-SIMD

[Uploadcare](https://uploadcare.com/)提供了[SIMD](https://zh.wikipedia.org/zh-tw/单指令流多数据流)加速的Pillow: [uploadcare/pillow-simd: The friendly PIL fork](https://github.com/uploadcare/pillow-simd)

Benchmark測試
[Pillow Performance](https://python-pillow.org/pillow-perf/)


### Linux
> CPU: Intel Celeron N4505 2.0GHz

安裝`libjpeg-dev`, `zlib1g-dev`後，安裝pillow-simd才會成功。但執行python出現`illegal hardware instruction`的錯誤訊息。

```bash title="Linux"
# install requirements
sudo apt install libjpeg-dev zlib1g-dev

# install pillow-simd
CC="cc -mavx2" pip install -U --force-reinstall pillow-simd
```

### MacOS
> MacBook Pro: 3.1GHz Intel Core i7

用brew安裝`jpeg`後，安裝pillow-simd成功，執行也沒問題。

```bash title="MacOS"
# install requirements
brew install jpeg
# install pillow-simd
pip install pillow-simd
```


## 總結

速度有比較快，希望有空來做benchmark。
