# UNIX/Linux

## Useful Command lines


```bash title="count files"
ls -l | wc -l
find . -type f |wc -l
```


```bash
do something 2>&1
```
file descriptor:

- 0: stdin
- 1: stdout
- 2: stderr

`2>&1`就是把stderr redirect 到 stdout

## System Admin

- `su my-user` 跟 `su - my-user` 的差別，多了一個 `-` 就是會把該user的環境變數跟shell配置代入，如果沒有`-`的話，就是沿用目前用戶的環境變數。

```bash title="設定語言"
sudo dpkg-reconfigure locales
```

## Desktop

### 輸入法

切換語系 `Super Key + Space` | 切換輸入法 `Ctrl + Shift`

[ChineseInputMethod - Debian Wiki](https://wiki.debian.org/ChineseInputMethod)

```bash title="設定輸入法"
im-config
```

```bash
apt install fcitx5-chewyin ?
```

### Ref

- [Fcitx - 維基百科，自由的百科全書](https://zh.wikipedia.org/zh-tw/Fcitx)
- [小麥注音輸入法 on X: "我們更新了首頁 (https://t.co/7hY7IzhQJi)，修改了我們使用的社群網路平台，未來版本資訊也會從該處發布。歡迎舊雨新知前往，繼續給予指教！" / X](https://twitter.com/McBopomofo/status/1714799933969023391)

## examples

#!/bin/bash

```bash title="check AWS S3 key exists by a key list in a file (keys.txt) and output not exist results"
output_file="nonexistent_keys.txt"

while IFS= read -r key; do
    if aws s3 ls "s3://my-bucket/path/to/$key".jpg > /dev/null 2>&1; then
        echo "$key exists"
    else
        echo "$key not exists"
        echo "$key" >> "$output_file"
    fi
done < keys.txt
echo "done"
```

