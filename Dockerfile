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
RUN wget http://www.xunsearch.com/scws/down/scws-1.2.1.tar.bz2 -O /home/scws-1.2.1.tar.bz2
RUN tar xjf /home/scws-1.2.1.tar.bz2 -C /home
RUN cd /home/scws-1.2.1 ; ./configure ; make install
# 安装语言包
COPY ./locale.gen /etc/locale.gen
RUN locale-gen