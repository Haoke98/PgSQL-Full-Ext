# PgSQL-Full-Ext

A full extension docker container of PgSQL ( PostgreSQL ).

```postgresql
          name          | default_version | installed_version 
------------------------+-----------------+-------------------
 uuid-ossp              | 1.1             | 1.1               
 fuzzystrmatch          | 1.1             | 1.1               
 plpgsql                | 1.0             | 1.0               
 pg_stat_statements     | 1.9             | 1.9               
 pg_trgm                | 1.6             | 1.6               
 pgrouting              | 3.1.3           | 3.1.3             
 zhparser               | 2.2             | 2.2               
 pg_jieba               | 1.1.1           | 1.1.1             
 address_standardizer   | 3.4.2           | 3.4.2             
 postgis                | 3.4.2           | 3.4.2             
 postgis_tiger_geocoder | 3.4.2           | 3.4.2             
 postgis_topology       | 3.4.2           | 3.4.2             
(12 rows)
 
postgres=# 
```

### Use

### Build

```shell
docker build -t psql-full-ext:14-1.0 .
```