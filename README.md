# docker-php

日新网docker-php环境，内置debian:jessie和php、php-fpm、mysql

## 获取镜像

### 从github获取（推荐）

从github仓库clone该镜像：
```
git clone https://github.com/EcjtuNet/docker-php.git
```

构建镜像：
```
cd docker-php
docker build -t 'ecjtunet/php' .
```


### 从docker hub获取

从docker hub获取镜像：
```
docker pull ecjtunet/php
```

在本地新建以下目录：
```
app/mysql
app/web
app/logs
```

## 运行虚拟机
