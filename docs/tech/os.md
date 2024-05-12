# Operation System / Desktop

## Linux

### Debian

[如何知道目前Debian版本號碼](../blog/articles/231214how-to-check-debian-version.md)

#### Install

1. download [Debian](https://www.debian.org/distrib/) iso image file (default is amd64, compatible with Intel & AMD chip)
2. make a bootable USB drive (recommanded: [Rufus](https://rufus.ie/en/))

#### Desktop

install [Debian -- Details of package gnome-tweaks in bookworm](https://packages.debian.org/bookworm/gnome-tweaks), can change `Caps` to `Ctrl`

```bash title="install multiple desktop environment"
sudo tasksel
```

#### 輸入法

切換語系 `Super Key + Space` | 切換輸入法 `Ctrl + Shift`

[ChineseInputMethod - Debian Wiki](https://wiki.debian.org/ChineseInputMethod)

```bash title="設定輸入法"
im-config
```

```bash title="Install fcitx5 traditional chinese input"
apt install fcitx5 fcitx5-chinese-addons fcitx5-chewyin
```

reference:

- [Fcitx - 維基百科，自由的百科全書](https://zh.wikipedia.org/zh-tw/Fcitx)
- [小麥注音輸入法 on X: "我們更新了首頁 (https://t.co/7hY7IzhQJi)，修改了我們使用的社群網路平台，未來版本資訊也會從該處發布。歡迎舊雨新知前往，繼續給予指教！" / X](https://twitter.com/McBopomofo/status/1714799933969023391)


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

### Desktop

screenshot: `Windows+Shift+S`
### Servers
修改local DNS

`C:\WINDOWS\system32\drivers\ect\hosts` 要有管理員權限
