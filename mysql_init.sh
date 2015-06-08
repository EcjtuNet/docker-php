#!/bin/bash
ln -s /app/mysql /var/lib
/usr/bin/mysql_install_db
/usr/bin/mysqld_safe
