# SQLite

[SQLite Home Page](https://www.sqlite.org/index.html)

GUI client: [GitHub - little-brother/sqlite-gui: Lightweight SQLite editor for Windows](https://github.com/little-brother/sqlite-gui?utm_source=hackernewsletter&utm_medium=email&utm_term=data)

## Notice

- SQLite 沒有 truncate, 用 delete from

## Commands

```bash
$ sqlite3 new.db # create db
$ sqlite3 myprecious.db ".dump" ＞ output.sql # dump sql
$ sqlite3 new.db ＜ output.sql # import
# or
$ cat dumpfile.sql | sqlite3 new.db
```

```text title="sqlite basic commands"
.tables  # MySQL的show tables
.schema TABLENAME
.help
.quit
```

### export

```text title="export to csv"

 sqlite> .headers on
 sqlite> .mode csv
 sqlite> .output data.csv
 sqlite> SELECT customerid,
    ...>        firstname,
    ...>        lastname,
    ...>        company
    ...>   FROM customers;
 sqlite> .quit
```

```text title="dump sql"
sqlite> .output /path/to/out.sql
sqlite> .dump table_name
```

### import

```text title="import from csv"

 sqlite> .headers on
 sqlite> .mode csv
 sqlite> .import {FILE} {TABLE_NAME}
```

```bash title="export/import csv by command"
$ sqlite3 -header -csv c:/sqlite/chinook.db "select * from tracks;" > tracks.csv
$ sqlite3 -header -csv c:/sqlite/chinook.db < query.sql > data.csv
```

### mode

設定輸出格式，預設是 `list` ("|"分隔)



## Data type

[Datatypes In SQLite](https://www.sqlite.org/datatype3.html)

### Storage Classes

以下在SQlite儲存時定義不同的儲存格式：

- **NULL**. The value is a NULL value.
- **INTEGER**. The value is a signed integer, stored in 0, 1, 2, 3, 4, 6, or 8 bytes depending on the magnitude of the value.
- **REAL**. The value is a floating point value, stored as an 8-byte IEEE floating point number.
- **TEXT**. The value is a text string, stored using the database encoding (UTF-8, UTF-16BE or UTF-16LE).
- **BLOB**. The value is a blob of data, stored exactly as it was input.

其他：

- SQLite does not have a separate Boolean storage class. Instead, Boolean values are stored as integers 0 (false) and 1 (true).
- SQLite does not have a storage class set aside for storing dates and/or times. 但可用以下方式儲存，搭配[Date And Time Functions](https://www.sqlite.org/lang_datefunc.html)處理。
    - **TEXT** as ISO8601 strings ("YYYY-MM-DD HH:MM:SS.SSS").
    - **REAL** as Julian day numbers, the number of days since noon in Greenwich on November 24, 4714 B.C. according to the proleptic Gregorian calendar.
    - **INTEGER** as Unix Time, the number of seconds since 1970-01-01 00:00:00 UTC.


