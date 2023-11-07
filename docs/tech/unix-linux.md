# UNIX/Linux

## Command lines


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

## Debian/Ubuntu

## CentOS

```bash title="list all supported version"
yum --showduplicate list {package name}
```


