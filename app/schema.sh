#!/bin/bash
mysqladmin -u root create default
php /app/web/database_schema.php
