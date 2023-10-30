# PostgreSQL

## Functions

[PostgreSQL: Documentation: 16: Chapter 9. Functions and Operators](https://www.postgresql.org/docs/current/functions.html)

### datetime related

[PostgreSQL: Documentation: 16: 9.9. Date/Time Functions and Operators](https://www.postgresql.org/docs/current/functions-datetime.html)

daterange

```sql title="overlap"

    SELECT * FROM my_table WHERE DATERANGE(my_start::date , my_end::date, '[)') && DATERANGE( date '2018-01-01', date '2018-01-31', '[)')
```

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

## How-to

```sql title="truncate & auto increment 從頭開始"

   TRUNCATE table_name RESTART IDENTITY;

```

```sql title="sequence 亂掉 duplicate key error"

   SELECT setval('my_sequence_name', (SELECT max(id) FROM my_table));
```
