pg_autoctl create postgres     --hostname 172.16.125.212     --auth trust   --monitor postgres://autoctl_node@172.16.125.210:5432/pg_auto_failover?sslmode=require --pgdata /home/postgres/unicredit6 --pgctl /bin/pg_ctl --no-ssl
