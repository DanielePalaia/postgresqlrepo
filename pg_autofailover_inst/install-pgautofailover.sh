#!/bin/bash

echo 'step one: installing binary'
cp ./bin/pg_autoctl /usr/bin
chmod +x /usr/bin/pg_autoctl
cp -fR ./pgautofailover /usr/lib64/postgresql/bitcode/

echo 'step two: installing libs'
cp ./libs/pgautofailover.so  /usr/lib64/postgresql/
cp ./libs/pgautofailover.control /usr/share/postgresql/extension/

echo 'installing extension'
cp ./sql/*.sql  /usr/share/postgresql/extension/
