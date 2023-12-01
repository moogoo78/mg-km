---
date: 2023-12-01
title: ZAP弱點掃描
slug: security-zap-scan
categories:
  - Tech
  - Develop
---

[應用 OWASP ZAP 進行自動化網站弱掃 | 網絡行動科技](https://netivism.com.tw/blog/518)

[ZAP – ZAP - Baseline Scan](https://www.zaproxy.org/docs/docker/baseline-scan/)

原本文件提供的是docker指令，這邊轉成docker compose方便把設定記錄起來，測試的網址也可以用 `.env` 檔設定

```yaml title="compose.yml"
version: '3'
services:
  zaproxy:
    image: ghcr.io/zaproxy/zaproxy:stable
    volumes:
      - ./:/zap/wrk/:rw
    command: zap-baseline.py -t ${TEST_DOMAIN} -g gen.conf -r ${TEST_REPORT_FILENAME}.html
```

```ini title=".env"
TEST_DOMAIN=example.com
TEST_REPORT_FILENAME=testreport
```
