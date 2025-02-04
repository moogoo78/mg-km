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

# 自然攝影中心

[小圖連大圖](http://nc.biodiv.tw/bbs/showthread.php?t=27653)

## vBulletin 3.5

docker

## 資料處理

把mysql裡需要的資料取出來，轉成sqlite方便處理

1. Dump vbb35post and encoded as latin1

```bash
mysqldump -u root -p nc_biodiv --default-character-set=latin1 nc_biodiv vbb35post > post.sql
```

2. change encoding to utf8, edit post.sql (latin1 -> utf8mb4)

    - !SET NAMES utf8mb4
    - DEFAULT CHARSET utf8mb4

3. import back to mysql (get utf8 content) better check
    1. create database nc_nice
    2. mysql -u root -p nc_nice < post.sql

4. use adminer.php to export csv (post.csv)

5. import to sqlite3

```
sqlite> .headers on
sqlite> .mode csv
sqlite> .import post.csv post
```

3. 跟 4. 步驟也可以mysql直接轉csv或sql, import sqlite
甚至，python mysql client 直接讀取mysql也可以

### Prepare

分析data schema

- thread, post, thread有很多post, post 有些是科的目錄, 有些是種的內容
- attachment.php (attach)

BBCode

### Scrap Data

`scrap-data.py`

1. 從小圖連大圖, make `family.txt` 手工
2. 這一串posts (同一thread)取出所有科
3. 科裡面再連到種的清單

單一物種頁

取得higher taxa

產出 eggs.csv

### 輸出

`make-markdown.py`

#### 11ty

High Performance Blog

npx run watch








