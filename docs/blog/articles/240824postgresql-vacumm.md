---
date: 2024-08-24
title: PostgreSQL:刪除一堆欄位資料，資料庫佔用硬碟空間反而變大
categories:
  - Tech
tags:
  - PostgreSQL
---

# PostgreSQL刪除一堆欄位資料，資料庫佔用硬碟空間反而變大

一個原本佔用磁碟空間25.921GB的資料庫，刪除某個欄位內容資料(`SET foo=''`)，大概1000萬筆資料，發現資料庫佔用空間反而變大: 33.478GB(花了1703秒)。

PostgreSQL有個[VACUUM](https://www.postgresql.org/docs/current/sql-vacuum.html)指令，試用看看，果然執行完磁碟空間變成24.8GB(花了1106秒)。

VACUUM FULL清的最乾淨，但是花時間，而且會lock table，正式站要小心使用。

```sql
VACUUM FULL
```
