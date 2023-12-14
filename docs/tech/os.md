# Operation System / Desktop

## Linux

### Debian

🌿[如何知道目前Debian版本號碼](../blog/articles/231214how-to-check-debian-version.md)

#### Install

1. download [Debian](https://www.debian.org/distrib/) iso image file (default is amd64, compatible with Intel & AMD chip)
2. make a bootable USB drive (recommanded: [Rufus](https://rufus.ie/en/))

##### Desktop

install [Debian -- Details of package gnome-tweaks in bookworm](https://packages.debian.org/bookworm/gnome-tweaks), can change `Caps` to `Ctrl`

##### Development Environment

Install Python using Pyenv:

```bash
apt install build-essential \
libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
```

### CentOS

```bash title="list all supported version"
yum --showduplicate list {package name}
```


## Windows

修改local DNS

`C:\WINDOWS\system32\drivers\ect\hosts` 要有管理員權限
