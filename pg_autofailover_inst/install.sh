#!/bin/bash

echo 'step one: installing vmware postgresql binary'
yum install ./vmware/vmware-postgres-11.10-0.el7.x86_64.rpm

echo 'step two: installing pgautofailover'
./pg_auto_failover/install-pgautofailover.sh

echo 'step two: installing pgbackrest'
./pgbackrest/install-pgbackrest.sh
