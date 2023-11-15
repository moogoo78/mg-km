# MySQL

## How-to

mysql command

```bash
mysql -uroot -p {database_name}

mysql> show databases;
mysql> show tables;
mysql> show status;
```

mysqldump

### User權限
主要是在名為mysql的資料庫裡的user (table)

```
mysql> CREATE USER '{username}'@'{hostname}' IDENTIFIED BY '{password}'; -- hostname可以為'%'，表示任意ip都可進來

mysql> GRANT CREATE, ALTER, INSERT, UPDATE, DELETE, SELECT ON *.* TO '{username}@{hostname}'; -- *.* 是 {database.table}
mysql> GRANT ALL PRIVILEGES ON *.* TO '{username}@{hostname}';
```


## Function

### 時間

```sql
SELECT NOW(),CURDATE(),CURTIME() ;-- | 2012-06-04 14:19:42 | 2012-06-04 | 14:19:42 |
SELECT MONTH(FROM_UNIXTIME(add_date)) as month
SELECT NOW(), NOW() - INTERVAL 1 DAY ;今天跟昨天
```

ref: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html


unfinished:
http://moogoo78.github.io/comp/database/mysql.html
