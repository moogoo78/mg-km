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

