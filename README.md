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

```shell
docker run -p 65432:5432 --name pg14-full -e POSTGRES_PASSWORD=mysecretpassword -d psql-full-ext:14-1.0
```


### Build

```shell
docker build -t psql-full-ext:14-1.0 .
```

### TODO

* [ ]  Optimize the image size:
    * [ ] remove redundant software and installation packages after all installations are completed
    * [ ] delete caches.
    * [ ] apt autorremove.
* [ ] Implement plug-in installation source for use at home and abroad

### Final
```shell
root@f908771e2b8c:/# psql -U postgres
psql (14.11 (Debian 14.11-1.pgdg110+2))
Type "help" for help.

postgres=# SELECT name, default_version, installed_version FROM pg_available_extensions WHERE installed_version IS NOT NULL;
          name          | default_version | installed_version 
------------------------+-----------------+-------------------
 fuzzystrmatch          | 1.1             | 1.1
 pg_stat_statements     | 1.9             | 1.9
 pg_trgm                | 1.6             | 1.6
 plpgsql                | 1.0             | 1.0
 uuid-ossp              | 1.1             | 1.1
 pgrouting              | 3.1.4           | 3.1.4
 pg_jieba               | 1.1.1           | 1.1.1
 zhparser               | 2.2             | 2.2
 address_standardizer   | 3.4.2           | 3.4.2
 postgis                | 3.4.2           | 3.4.2
 postgis_tiger_geocoder | 3.4.2           | 3.4.2
 postgis_topology       | 3.4.2           | 3.4.2
(12 rows)

postgres=# select collname  from pg_collation where collname like '%zh%';
     collname     
------------------
 zh_CN
 zh_CN.gb2312
 zh_CN.utf8
 zh_CN
 zh-x-icu
 zh-Hans-x-icu
 zh-Hans-CN-x-icu
 zh-Hans-HK-x-icu
 zh-Hans-MO-x-icu
 zh-Hans-SG-x-icu
 zh-Hant-x-icu
 zh-Hant-HK-x-icu
 zh-Hant-MO-x-icu
 zh-Hant-TW-x-icu
(14 rows)

postgres=# 
```