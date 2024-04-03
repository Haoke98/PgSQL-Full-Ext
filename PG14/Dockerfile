FROM postgis/postgis:14-3.4
COPY ./sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y gcc
RUN apt-get install -y wget
RUN apt-get install -y cmake
RUN apt-get install -y bzip2
RUN apt-get install -y g++
RUN apt-get install -y postgresql-server-dev-14
RUN apt-get install -y libboost-graph-dev
# 安装语言包
COPY ./locale.gen /etc/locale.gen
RUN locale-gen
# 安装 libscws-dev , 就因zhparser需要
RUN cd /home; wget -q -O - http://www.xunsearch.com/scws/down/scws-1.2.1.tar.bz2 | tar xjf - ;
RUN cd /home/scws-1.2.1 ; ./configure ; make install
# 安装 zhparser:2.2
RUN cd /home; wget -q -O - https://gitee.com/sadam98/zhparser/releases/download/V2.2/zhparser-2.2.tar.gz | tar xvzf - ; cd /home/zhparser-2.2; PG_CONFIG=/usr/lib/postgresql/14/bin/pg_config make && make install
# 安装 pg_jieba:2.0.1
RUN cd /home; wget -q -O - https://gitee.com/sadam98/pg_jieba/releases/download/v2.0.1/pg_jieba-2.0.1-full.tar.gz | tar xvzf - ;
RUN cd /home/pg_jieba; mkdir build; cd build;cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/14/server .. ; make; make install
# 安装 pgrouting:3.1.4
RUN cd /home; wget -q -O - https://gitee.com/sadam98/pgrouting/releases/download/v3.1.4/pgrouting-3.1.4.tar.gz | tar xvzf - ;
RUN cd /home/pgrouting-3.1.4; mkdir build; cd build; cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/14/server .. ; make; make install

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
RUN chmod +x /docker-entrypoint-initdb.d/10_postgis.sh
