# PostgreSQL

## How-to

## Dump/Import

```bash title="dump"

$ pg_dump -U USERNAME DBNAME > dbexport.pgsql
$ # PGPASSWORD="mypassword" pg_dump -U myusername dbname 密碼 > output.sql$ pg_dump -U postgres -f /tmp/dump.sql.gz --compress=5 --no-owner dbname
```

```bash title="import"
$ psql -f backup.sql dbname dbuser

# specific table
pg_dump -U xxx public.TABLE_NAME DATABASE_NAME > out.sql
pg_dump -U xxx -d DB_NAME -t TABLE_NAME > out.sql

## export csv
$ psql -U user -d db_name -c "Copy (Select * From foo_table LIMIT 10) To STDOUT With CSV HEADER DELIMITER ',';" > foo_data.csv
```

```sql
\copy (Select * From foo) To '/tmp/test.csv' With CSV DELIMITER ',' HEADER
```

### Datetime related

daterange

```sql title="overlap"
SELECT * FROM my_table WHERE DATERANGE(my_start::date , my_end::date, '[)') && DATERANGE( date '2018-01-01', date '2018-01-31', '[)')
```

ref: [PostgreSQL: Documentation: 16: 9.9. Date/Time Functions and Operators](https://www.postgresql.org/docs/current/functions-datetime.html)

### Big data



```sql title="estimated count"
SELECT reltuples FROM pg_class WHERE relname = 'large_table'
```

```sql title="產生10M records"
INSERT INTO users
SELECT
    --- Ten million records
	generate_series(1,10000000) AS id,
    --- Example: "e6f2c6842d146c518185e1e47add9532"
    substr(md5(random()::text), 0, 50) AS name;
```

### Clean

```sql title="truncate & auto increment 從頭開始"
TRUNCATE table_name RESTART IDENTITY;
```

```sql title="sequence 亂掉 duplicate key error"
SELECT setval('my_sequence_name', (SELECT max(id) FROM my_table));
```

## Reference

- [《 PostgreSQL 各版本特性及差異比較表 》 »... - Ant Yi-Feng Tzeng | Facebook](https://www.facebook.com/yftzeng.tw/posts/pfbid02ykJJUubLDfdQ3oZcr88P8WYK9it4UHqv9BKQSYS3UpAGKEwNeeUjC66Heice62cDl)

### Functions

- [PostgreSQL: Documentation: 16: Chapter 9. Functions and Operators](https://www.postgresql.org/docs/current/functions.html)


### Optimize

- [How we optimized PostgreSQL queries 100x | by Vadim Markovtsev | Towards Data Science](https://towardsdatascience.com/how-we-optimized-postgresql-queries-100x-ff52555eabe)

- [How we optimized Python API server code 100x | by Vadim Markovtsev | Towards Data Science](https://towardsdatascience.com/how-we-optimized-python-api-server-code-100x-9da94aa883c5)

- [Explain PostgreSQL](https://explain.tensor.ru/plan/) 視覺化 explain














