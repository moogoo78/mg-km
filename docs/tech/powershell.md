#Powershell

- [PowerShell Tutorial](http://xahlee.info/powershell/index.html) (Xah Lee)

## Docs
- [相容性別名 - PowerShell | Microsoft Docs](https://docs.microsoft.com/zh-tw/powershell/scripting/learn/compatibility-aliases?view=powershell-7.1)
- https://docs.microsoft.com/zh-tw/powershell/scripting/overview?view=powershell-7.1

## How-To

原本command的SET PATH=C:\path\to;%PATH%;

```powershell title="set PATH"
$Env:PATH += ";$pwd"
```


tasks

```powershell
taskkill
tasklist
```
