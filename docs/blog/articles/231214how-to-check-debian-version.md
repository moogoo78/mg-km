---
date: 2023-12-14
title: 如何知道目前Debian版本號碼
categories:
  - Tech
  - HowTo
---

# 如何知道目前Debian版本號碼

LSB (Linux Standard Base)，Linux Distribution版本，代碼等基本發布訊息

```bash
lsb_release -a
```

一句話說出Linux發布系統跟版本

```bash
cat /etc/issue
```

Debian 9以後，除了基本訊息，還有一些不知道可以做什麼的 URL

```bash
cat /etc/os-release
```

hostnamectl就像"關於我的電腦"，包含一些有用的硬體訊息

```bash
hostnamectl
```

但如果要知道minor version的話就要看

```bash
cat /etc/debian_version
```
