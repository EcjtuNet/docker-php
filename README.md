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

将你的web程序放在app/web目录下，nginx默认root在app/web/public

运行以下命令之后绑定的地址为localhost:8000
```
cd app
docker run -ti \
  -p 8000:80 \
  -v $PWD:/app \
  -e INIT=schema.sh \
  ecjtunet/php
```

##指定启动脚本

docker run 的时候加上-e参数可以指定启动脚本，例如：
```
  -e INIT=schema.sh
```
这样docker在run之后会执行app/schema.sh，你可以通过修改这个文件来执行需要的启动命令，比如composer update。可以指定多个-e参数。
