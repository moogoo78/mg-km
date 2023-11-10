---
date: 2023-11-09
title: 很多檔案(幾十萬以上)適合放在同一個資料夾嗎?
category:
  - Tech
  - Develop
---
結論:

一個資料夾放很多檔案就是會很慢，XFS (有B tree)會比較快?
[linux - Filesystem large number of files in a single directory - Server Fault](https://serverfault.com/questions/43133/filesystem-large-number-of-files-in-a-single-directory)

資料夾命名參考:
[storage - Storing a million images in the filesystem - Server Fault](https://serverfault.com/questions/95444/storing-a-million-images-in-the-filesystem)

- 拆檔名，前置字元當目錄結構 `000/000/012/00000000012345.jpg`, `123/456/789/12345678901234.jpg`
- 前置字元用hashed內容，`515d7eab9c29349e0cde90381ee8f810` => `/51/5d/7e/ab/9c/29/349e0cde90381ee8f810.jpg`
