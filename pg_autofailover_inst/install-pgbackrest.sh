#!/bin/bash

echo 'step one: installing dependencies and software'
yum install perl perl-Time-HiRes perl-Digest-SHA perl-JSON-PP

echo 'step two: configuring repo'
mkdir -p /etc/pgbackrest
mkdir -p /etc/pgbackrest/conf.d
touch /etc/pgbackrest/pgbackrest.conf
chmod 640 /etc/pgbackrest/pgbackrest.conf
chown postgres:postgres /etc/pgbackrest/pgbackrest.conf
