---
date: 2023-12-18
categories:
  - Tech
tags:
  - image
---

# About Images

## Image Resolution

- [The 72 PPI Web And Screen Resolution Myth](https://www.photoshopessentials.com/essentials/the-72-ppi-web-resolution-myth/)

   - 72 PPI 是 80年代 Mac 定義 (配合 Macintosh 和 ImageWriter 設備)

   - 現在螢幕普遍 PPI 都比 72 PPI 高很多，電腦處理只看 width, height 不看 PPI (不同 PPI 相同 width, height, 看起來還是一樣)

   - 只有列印 PPI 才有差別


## RAW

有DNG, NEF等格式，python有好用的[rawpy](https://github.com/letmaik/rawpy)可以直接轉換成其他格式:

```python title="RAW to TIFF範例"
import rawpy
import imageio

path = 'image.nef'
with rawpy.imread(path) as raw:
    rgb = raw.postprocess()
imageio.imsave('default.tiff', rgb)
```

postprocess的參數: [Params class — rawpy 0.22.0 documentation](https://letmaik.github.io/rawpy/api/rawpy.Params.html)

- use_camera_wb: default `False`。結果如下圖: 左邊是True, 右邊是False，不知道原理，但左邊看起來比較正確。
- output_bps: default `8`。8 的話檔案是1百多MB，設定成16的話是2百多MB，我看不出差別。
- otuput_color: `rawpy.ColorSpace.ProPhoto` 。不懂，有空再來研究 [ProPhoto RGB - 维基百科，自由的百科全书](https://zh.wikipedia.org/zh-tw/ProPhoto_RGB)

![camera-wb](../../assets/blog/image-raw-tiff-camera-wb.png)
