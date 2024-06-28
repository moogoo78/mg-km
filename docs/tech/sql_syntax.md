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

```sql title="only test in MySQL"
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

Group by in aggregate should use having

```sql title="找出group起來count超過2個的"
SELECT COUNT(*), foo.some_id from (
    SELECT COUNT(*), some_id, created_datetime::date
    FROM some_table
    GROUP BY some_id, created_datetime::date
    ORDER BY some_id
) foo
GROUP BY some_id HAVING count(*) > 1;
```

## JSON

[PostgreSQL: Documentation: 12: 9.15. JSON Functions and Operators](https://www.postgresql.org/docs/12/functions-json.html)

### query JSONB

```sql title="query JSONB"
select * from specimen_specimen where source_data ->'dups' @> '[{"SN":"69598"}]'
```

### update JSONB

Update data in JSONB field

```sql title="using jsonb_set"
UPDATE record
SET source_data = jsonb_set(source_data, '{foo_name}', '"foo"', true),
field_note = 'bar'
WHERE id=161643;
```

arguments: `jsonb_set(target jsonb, path text[], new_value jsonb [, create_missing boolean])`


## Complex

CAST string to int and use REGEX_REPLACE to clean out non-number char

```sql title="if field_number is 6751 of 3 => will be selected"
select * from record where id > 173 and id <180 and cast(regexp_replace(field_number, '[^0-9]+', '', 'g') as Integer) > 6000;
```
最好也要把‘’空字串排除，不然遇到沒有數字的還是會cast error
