# UNIX/Linux

## Useful Command lines

### Shell

帳號的shell設定都是寫在 `/etc/passwd`

看目前的shell
```bash
echo $0
# or
ps -p $$
#or
echo $SHELL
```

列出系統的shells

```bash
cat /etc/shells
```

```bash title="設定預設的shell"
chsh -s /bin/zsh
```

```bash
do something 2>&1

```
file descriptor:

- 0: stdin
- 1: stdout
- 2: stderr

`2>&1`就是把stderr redirect 到 stdout


### Editing file

```bash title="delete some columns in csv"
cut -d, -f [range]
```
examples:

test.csv

> A,B,C,D,E,F,G,H


```bash
cut -d, -f 1 < test.csv # A
cut -d, -f 1-5 < test.csv # A,B,C,D,E
cut -d, -f 1-3,6- < test.csv # A,B,C,F,G,H
```

```bash title="append , to each file in csv"
sed 's/$/,/' input_file > output_file
```

### Files and Directories

#### find and ...

```bash
find . -size -5k -type f
```

```bash title="find all folders and delete OS thumb files"
find . -name ".DS_Store" -delete
find . -type f -name '._*' -delete
find . -type f -not -name '._*' -size -5k

```

```bash title="count number of files"
find [path] -type f | wc -l
```

``` bash title="batch change extension to lower case (.JPG → .jpg)"
for f in *.JPG; do mv "$f" “${f%.JPG}.jpg”; done
```

#### count, sum

```bash title="count files"
ls -l | wc -l
find . -type f |wc -l
```

```bash title="count files per directory"
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr
```
via: https://stackoverflow.com/a/39622947/644070

- `du -a`: list all files include directory ( 416  ./images/path/to => 416 is size)
- `cut -d/ -f2`: remove sections from each line of files, -d: delimiter, -f: select only these fields (把下一層目錄，這邊是`image` 取出)
- `uniq -c`: -c: count
- `sort -nr`: -n: numeric-sort, -r: reverse


```bash title="find file numbers in each folder"
find . -type f | cut -d/ -f2 | sort | uniq -c
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr
```
via: https://stackoverflow.com/a/54305758/644070


### process data (awk, sed, grep, tr)

```bash title="get url and download file in structured text file"
cat foo.csv | awk -F, '{print "curl -O https://url.to/"$3".jpg"}' | bash
```

```bash title="my-mp3-list.txt"
#3-Let It Go,https://www.youtube.com/watch?v=L0MK7qz13bU
awk -F, '{print "youtube-dl " $2 " -x --audio-format mp3 -o " $1 ".mp3"}' my-mp3-list.txt > mp3-cmds.sh
./mp3-cmds.sh
```

```bash title=" get certain attribute value in HTML tag"
# single quote
grep -rho 'data-ga-category="[^"]*"' ./path/to | sed 's/data-ga-category="//' | sed 's/"$//' | uniq > ga-category.txt
# double quote
grep -rho 'data-ga-category="[^"]*"' ./path/to | sed 's/data-ga-category="//' | sed 's/"$//' | uniq >> ga-category.txt
```

```bash title="replace line-break (\n) to ,"
tr '\n' ',' < source-file
```

```bash title=" delete character"
tr -d `\n` < source-file
```

### File Coding

```bash title="check file MIME coding"
file -ib {foo}
```
- -b brief output (ignore file name)
- -i include MIME-type information
but maybe wrong, ex: file indicated "ISO-8859-1", but it's cp950.

```bash title="iconv"
iconv -f cp950 -t UTF-8 {input-file} > {output-file}
```

### Networks

telnet & openssl:
```bash title="連線測試"
telnet my-host.com 80
GET / HTTP/1.1
Host: my-host.com
Connection: close (自動關閉連線)
```

```bash title="https連線測試"
openssl s_client -connect my-host.com:443
GET / HTTP/1.1
Host: my-host.com
Connection: close (自動關閉連線)
```


```bash title="connect by samba"
smbclient //some-ip/folder -U my-username

smb: \> ls
```

```bash title="mount windows"
sudo mount -t cifs //some-ip/path my-local/ -o username=my-username,password=my-password
```

`smbmount` or `smbfs` seems deprecated, use `cifs` instead (Debian package: `cifs-utils`)

### System Admin

- `su my-user` 跟 `su - my-user` 的差別，多了一個 `-` 就是會把該user的環境變數跟shell配置代入，如果沒有`-`的話，就是沿用目前用戶的環境變數。

```bash title="設定語言"
sudo dpkg-reconfigure locales
```

test HD Performance, use the dd command to measure server throughput (write speed):
```bash
dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
```
[Linux and Unix Test Disk I/O Performance With dd Command - nixCraft](https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/)


### Multimedia

```bash title="conver mp3 (ffmpeg)"
find *.wav -exec ffmpeg -i {} {}.mp3 \;
```

## Other examples


```bash title="check AWS S3 key exists by a key list in a file (keys.txt) and output not exist results"

#!/bin/bash
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

