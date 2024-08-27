---
date: 2024-01-30
title: 拿到Excel資料是1個欄位，很多列(Row)，要變成1列很多欄(Column)的形狀
categories:
  - Tech
tags:
  - tips
---

# 拿到Excel資料是1個欄位，很多列(Row)，要變成1列很多欄(Column)的形狀

先把Excel變成csv (編碼要特別選UTF-8)

然後整裡ChatGPT給我的答案，我只取我容易理解的。

用`tr`把換行改成逗號，再輸出成output.csv:

```bash
tr '\n' ',' < input.csv > output.csv
```

裡面還會有Windows的`^M`換行符號，再用`tr`去除一次:

```bash
tr -d '\r' < output.csv > out2.csv
```

tr真好用，懶人的sed。
