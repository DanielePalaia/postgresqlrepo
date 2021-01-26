#!/bin/bash
  
echo 'step one: pg_config'
cp ./pg_stat_statements/pg_config /usr/bin/
chmod 755 /usr/bin/pg_config

echo 'step two: copy .sql and control'
cp ./pg_stat_statements/*.sql /usr/share/postgresql/extension
cp ./pg_stat_statements/*.control /usr/share/postgresql/extension

echo 'step three copy .so'
cp ./pg_stat_statements/*.so /usr/lib64/postgresql
