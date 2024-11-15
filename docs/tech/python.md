# Python

[Status of Python versions](https://devguide.python.org/versions/)

## How-to

### String

```python title="padding 0"
f'{n:03}'
'%03d' % n
'{0:03d}'.format(n)
'{foo:03d}'.format(foo=n)
'{:03d}'.format(n)
```
### data struct

[Sorting Techniques — Python 3.12.3 documentation](https://docs.python.org/3/howto/sorting.html)

```python title="sort by key"
sorted(student_tuples, key=lambda student: student[2])
```

### file and directories

```python title="mkdir"
Path.mkdir(parents=True, exist_ok=True) # parents=True: mkdir -p, exist_ok: ignore error if folder exist
```

```python title="copy files or folder"
import shutil

shutil.copyfile(src, dst)

# 2nd option
shutil.copy(src, dst)  # dst can be a folder; use shutil.copy2() to preserve timestamp
```
via: https://stackoverflow.com/a/123212/644070

## Issues

函式預設輸入值如果是 `list`、`dictionary`、`instance of most classes` (mutable object)，在函式定義的時候就建立了，之後載呼叫同一個函式會持續保留裡面的數值。

ref:
- chatGPT: https://chat.openai.com/share/4be34b81-3eb6-4d99-99cf-20881e2fc831
- python docs: https://docs.python.org/3/tutorial/controlflow.html#default-argument-values

### datetime

[datetime — Basic date and time types — Python documentation](https://docs.python.org/3/library/datetime.html)

[format codes](https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes)

```python title="strptime"
datetime.strptime(row['last_login'], '%Y-%m-%d %H:%M:%S+00') # 2021-01-01 12:03:34+00
datetime.strptime(row['created_time'], '%Y-%m-%d %H:%M:%S.%f+00') # # 2021-01-01 12:03:34.934533+00
```

### csv

BOM header
```python
encoding='utf-8-sig'
```

## Packages

### PIL, PILLOW

`Image.ANTIALIAS` 新版改成 `Image.Resampling.LANCZOS`

### Build exe file

- [Nuitka/Nuitka: Nuitka is a Python compiler written in Python.](https://github.com/Nuitka/Nuitka)
  - [PyInstaller より圧倒的に優れている Nuitka の使い方とハマったポイント | つくみ島だより](https://blog.tsukumijima.net/article/python-nuitka-usage/)

### GUI

- [Beutiful GUI’s Built With Python. Welcome back! Python is one of my… | by Manpreet Singh | Medium](https://preettheman.medium.com/beutiful-guis-built-with-python-bf58a8f28d40)

### SQLAlchemy

```python
query = session.query(UserSong)
query = query.join(Song, Song.id == UserSong.song_id)
query = query.filter(
    and_(
        UserSong.user_id == user.id, 
        UserSong.is_liked.is_(True),
        Song.genre == 'rock'
    )
)
```

```python title="join, group by"
session.query(Collection.name, func.count(Record.collection_id)).select_from(Record).join(Record.collection).group_by(Collection).all()
```

Note: important to place `with_entities` after the join

```python
query = query.with_entities(func.count())
liked_count = query.scalar()

sql_qry = select([foo.c.id.label("id"), 
                  foo.c.title.label("title"), 
                  bar.c.name.label("name")], 
                 foo.c.id == bar.c.foo_id)

my_result_qry = session.query(MyResult).from_statement(sql_qry)
```

```python title="query json"
Person.query.filter(Person.source_data['pid'].astext == x)
```
要加 `astext` 不然找不到 (就如同`->>`, 沒加astext就是`->`)


要重新給一個值，不然程式會以為沒變

```python title="Update json field data"
record = session.query(YourModel).first()
record.data = {**record.data, "new_key": "new_value"}  # Reassign with a new dictionary
session.commit()
```



## Reference

### Learning Resource

- [Ten thousand meters - Python behind the scenes](https://tenthousandmeters.com/tag/python-behind-the-scenes/)
- [dabeaz-course/python-mastery: Advanced Python Mastery (course by @dabeaz)](https://github.com/dabeaz-course/python-mastery?utm_source=hackernewsletter&utm_medium=email&utm_term=code) exercise codes with PDF
- [Code Review of Senior Python Engineers](https://www.canva.com/design/DAFoVEZETAU/fa33DHLu_PlYHuTWYOAoww/view#1)

### Related with R

- [Statistics in Python with R, Liang Bo Wang](http://blog.liang2.tw/2014-pyR-stat/?full#cover) Python與R的關係，強項在那裡


## Cookbook

```python title="copy 100x100 images"
import os
from pathlib import Path
import shutil


def copy100(prefix):
    for r, d, l in os.walk('./source-dir'):
        for f in l:
            p = Path(r, f)
            if p.suffix.upper() == '.JPG':
                target = Path('target-dir', f'{prefix}-{f}')
                shutil.copyfile(p, target)


for i in range(100):
    copy100(f'{i:03}')
```

```python title="change all file with JPG extension to jpg (lower-case)"
from pathlib import Path
import os

for r, d, f in os.walk('/path/to'):
    for x in f:
        if '.JPG' in x:
            p = Path(r, x)
            p.rename(Path(r, x.replace('.JPG', 'jpg')))
```
