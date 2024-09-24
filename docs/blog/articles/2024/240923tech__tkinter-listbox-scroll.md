---
date: 2024-09-23
categories:
  - Tech
tags:
  - python
  - tkinter
---

# Python Tkinter的Listbox無法scroll

環境: Windows 11, Python 3.8

用鍵盤上下鍵觸發`Listbox.yview_scroll`也沒反應。

這個很詭異的問題是下拉選單原本是用python預設的srcoll動作，但是選項小於15個時, 不會有scroll的反應, 目前用手動加上scrollbar解決。

