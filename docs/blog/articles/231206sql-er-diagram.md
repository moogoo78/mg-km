---
date: 2023-12-06
title: 用SQL schema產生Entity Relationship Diagram
categories:
  - Tech
  - PostgreSQL
  - Diagram
  - Docker
---

看到一個schema.sql，為了要讓大家快速理解而又不用直接看SQL語法性，還是看Entity Relationship Diagram ([ER模型](https://zh.wikipedia.org/zh-tw/ER模型)) 比較方便。通常功能強大、有UI界面的Database client都有這樣的功能，但是我懶得在本地電腦架設資料庫，還要安裝華麗的[pgAdmin](https://www.pgadmin.org/)或是[DBeaver](https://dbeaver.io/)之類的，而且想到要設定權限、網路之類就覺得會很很麻煩。

於是google了一下，看到N種處理的方法，有Docker的優先，隨便看了一個github 專案：[moe-protagonist/postgres-plantuml-erd-docker: Dockerfile for creating ERDs with PlantUML](https://github.com/moe-protagonist/postgres-plantuml-erd-docker)，似乎方便，把專案clone下來後，照他寫的說明，果然就成功產生圖片了，真的讚。

```bash
$ docker build . -t moea/erd
$ id=$(docker create moea/erd)
$ docker cp $id:/erd/schema.png .
$ docker rm -v $id
$ open schema.png
```

(原始文件的docker cp那句少了一個 `:`)

說明測試成功後，把sql目錄裡的schema.sql換成我的，然後照說明從docker build再重跑一次，就產生我要的圖檔了，真的很不費心力。
