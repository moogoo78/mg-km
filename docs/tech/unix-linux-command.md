# UNIX/Linux

## Command lines

- [Minimal safe Bash script template - Better Dev](https://betterdev.blog/minimal-safe-bash-script-template/)
- Mosky slide: [Get Power From Command Line - Speaker Deck](https://speakerdeck.com/mosky/get-power-from-command-line)


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

### 找東西

find infile (grep-like):

- [BurntSushi/ripgrep: ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)

- [ggreer/the_silver_searcher: A code-searching tool similar to ack, but faster.](https://github.com/ggreer/the_silver_searcher)


```bash title="find file size < 5k"
find . -size -5k -type f
```
```bash title="find file named: foo and modified in 5 days"
find . -name foo -mtime 5
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

#### grep

- o, --only-matching: 只印出找到的字串，不會印整行(這個在minified檔案裡很煩)
- P, --perl-regexp: 可以用regex
- l, 只有引檔名

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

```bash title="count top20 big folders"
sudo du -a /dir/ | sort -n -r | head -n 20
```

```bash title="count size each dir"
du -sh *
```

```bash title="count folder layer 1 sum size"
# du -d 1 |sort -nr | cut -f2- | xargs du -hs # mac
du --max-depth=1 |sort -nr | cut -f2- | xargs du -hs
```

```bash title="count number of lines in a file"
cat some_file.txt | wl -c
```

### process data (awk, sed, grep, tr)

```bash title="print certain line in a file"
sed -n 6489p some_fine # print line number: 6489
```

```bash title="insert text to certain line"
sed -i '1 i\foo' path/to/file # insert "foo" string to head of the file
sed -i '2 i\bar' path/to/file # insert "foo" string to line 2
```

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

[拿到Excel資料是1個欄位，很多列(Row)，要變成1列很多欄(Column)的形狀](../blog/articles/240130-csv-oneline.md)


split big file to chunk (1000 line per file), prefix will gose to prefixaa, prefixab, prefixac...
```bash title="split"
split -l 1000 file-to-be-split prefix.
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


很多網路指令都有新的選擇(ifconfig, netstat, route, arp) => `ip`
[nixCraft - Ugh 😤 ip command is the most significant change in... | Facebook](https://www.facebook.com/story.php?story_fbid=pfbid0FdqzZ1qfoAgsVfmy4g4xFzXQgbbwSrUqkhcNyYydbG7rvLSbMzScHKvdnL93vS2tl&id=100064470498902&mibextid=WiMSqg&paipv=0&eav=AfYS9RvWDVilBhXn9y95xGkEFtCrjT53HS9Su5-cZB7DplUkbfgs9vLDO_M8zhJ-9J8&_rdr)

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

[htop explained | peteris.rocks](https://peteris.rocks/blog/htop/)

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

