# SQL Syntax

Basic
```sql
CREATE DATABASE mydb
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

ALTER TABLE `user`
ADD `intro` text COLLATE 'utf8_general_ci' NULL AFTER `status`;

ALTER TABLE `run_log`
ADD `step` int(11) NULL;
```

CRUD:
```sql
INSERT INTO tbl_name (col1,col2) VALUES(15,col1*2);
INSERT INTO tbl_name (a,b,c) VALUES(1,2,3),(4,5,6),(7,8,9);
UPDATE user SET password=password('新密碼') where user='root';
DELETE FROM user where id = xx;
```

LIMIT:
```sql
SELECT * FROM foo LIMIT 20
SELECT * FROM foo LIMIT 20 OFFSET 40 -- 從40個以後抓20個
SELECT * FROM foo LIMIT 40, 20 -- 同上
LIMIT -1 OFFSET 100 # 從 100 開始, 沒有限制 (SQLite)
```

中文筆畫排序
```
CONVERT( 欄位名稱 using big5) -- only test in mysql
```

查看database容量:

``sql title="only test in MySQL"
SELECT table_schema "database_name",
sum( data_length + index_length ) / 1024 /
1024 "Data Base Size in MB",
sum( data_free )/ 1024 / 1024 "Free Space in MB"
FROM information_schema.TABLES
GROUP BY table_schema ;
```

SELECT and UPDATE:

```sql
UPDATE table_A LEFT JOIN table_B ON table_B.id = table_A.bid
SET table_A.some_column = 'some_value' WHERE some_condition;
```

增加欄位 add column:

```sql
ALTER TABLE contacts ADD email VARCHAR(60);
ALTER TABLE contacts ADD email VARCHAR(60) AFTER name;
```

```sql
---- 欄位 col1 出現超過 5 次:
-- WHERE (放在 group 前面) 在這裏不能用, 要改用 having
SELECT COUNT(*) AS cnt from {table} GROUP BY {col1} HAVING cnt > 5 ORDER BY cnt DESC;

-- 欄位 col1 不重複, 符合條件, 總共筆數
SELECT COUNT(DISTINCT {col1}) FROM {table} WHERE {col2} ...
```
