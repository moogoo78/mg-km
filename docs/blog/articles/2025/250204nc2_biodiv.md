---
date: 2025-02-04
categories:
  - Tech
tags:
  - python
  - sqlite
  - mysql
  - php
---

# 自然攝影中心 (nc.biodiv.tw)

## 系統狀態

系統板本: vBulletin 3.6.3 (付費版本)
- PHP: 5.6
- MySQL: 5.5

附加檔案:
- 磁碟空間: 202,188MB
- 檔案數: 1,669,049 (包含.attach跟.thumb)

### 問題

- 系統老舊
- 資安風險
  -常被通報
  - index.php, includes目錄等被植入莫名程式碼 (2021年底-2022年初移除)

## 目標

- 把內容取出，結構化部分內容 (植物圖鑑 [小圖連大圖](http://nc.biodiv.tw/bbs/showthread.php?t=27653))
- 以靜態HTML頁面呈現，查詢
- 封存並關閉現有網站

## 方法

- 從 vBulletin 資料庫擷取"小圖連大圖"的文章串
- 下載並整理相關的圖片檔案
- 轉換內容為 11ty 可用的 Markdown 格式
- 生成靜態 HTML 網站

### 實際處理紀錄

### 分析Database Schema

文字內容

- 主要內容在`post`資料表裡，`thread`會關聯很多筆`post`
- post有些是科的目錄，有些是種的內容，要區分
- "小圖連大圖"是從一個threadid: 27653開始，主要是**科(family)**的連結
- 大部分的各科的post包含**屬(genus)**，會有科以下的**物種(Species)** 學名，少部分比較大的科如豆科菊科會是thread，然後再關聯許多筆post
- 內容有很多BBCode

照片檔

- 路徑是`/src/html/nc/vbb35data/[1-9]/`的目錄
- 副檔名是.attach跟.thumb
- 讀取照片是`attachment.php`處理
- 路徑規則是user_id位數分開，如: 1234，檔案的路徑就是 ~/vbb35data/1/2/3/4/xxx.attachment (xxx即attachmentid)

#### MySQL to SQLite 

把需要的資料取出來，轉成Sqlite方便處理

1. Dump vbb35post and encoded as `latin1`

```bash
mysqldump -u root -p nc_biodiv --default-character-set=latin1 nc_biodiv vbb35post > post.sql
mysqldump -u root -p nc_biodiv --default-character-set=latin1 nc_biodiv vbb35attachment > attachment.sql
```

2. Change encoding to utf8, edit post.sql and attachment.sql (latin1 -> utf8mb4)

    - !SET NAMES utf8mb4
    - DEFAULT CHARSET utf8mb4

3. Import back to mysql (utf8 client readable for better check)

    1. create database nc_nice
    2. `mysql -u root -p nc_nice < post.sql`
    3. `mysql -u root -p nc_nice < attachment.sql`

4. Use adminer.php to export csv

5. import to sqlite3

```
sqlite> .headers on
sqlite> .mode csv
sqlite> .import post.csv post
```

> [!NOTE]  
> 3. 跟 4. 步驟也可以mysql直接轉csv或sql, import sqlite
甚至，python mysql client 直接讀取mysql也可以，但是我比較熟adminer.php，也習慣用adminer.php查看資料，所以才花點力氣轉來轉去。


### Transform Data

寫一個script處理: `scrap-data.py`

1. 從小圖連大圖, 複製貼上產生`family.txt`，純手工，寫parser效益太低
2. 這一串thread的post取出所有科跟種的資料
3. parse物種post的內容

  - 取得higher taxa (很大概，視情況手工處理細節)
  - 圖檔列表attach (list)

4. 產出整理後的資料: eggs.csv (4千多筆)

### 11ty Static Site Generator for Render

`make-markdown.py`

- 從整理好的csv轉換成11ty的markdown格式跟metadata
- 產生所有科跟屬的清單頁面，直接匯出到 `11ty_folder/posts/plantae-index`
- 種的頁面匯出到 `11ty_folder/posts/plantae`
- 首頁的科清單是用產出的family.txt，手動貼到index.njk裡
 
#### 11ty build

11ty配合[High Performance Blog](https://github.com/google/eleventy-high-performance-blog) template產生最終呈現網頁。

處理參考High Performance Blog的指令

> [!Note]
> 有4千多個檔案，會發生JavaScript heap out of memory error
> 執行
> NODE_OPTIONS="--max-old-space-size=4096" npx eleventy
> 似乎就好了


## 待辦事項

New Site (NC2)
- [x] build all pages (2025-02-03)
- [ ] 11ty deployment to (Cloundflare or S3/Cloudfront?)
- [ ] image transfer and link
- [ ] decorate 11ty layout
- [ ] search (install findpage plugin?)

Legacy Site (nc.biodiv.tw)

- [ ] archive

## 貢獻

歡迎任何貢獻！
