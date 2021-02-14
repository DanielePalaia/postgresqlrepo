pgbackrest --stanza=unicredit --log-level-console=info stanza-create
pgbackrest --stanza=unicredit --log-level-console=info check
pgbackrest --stanza=unicredit --log-level-console=info backup
pgbackrest --stanza=demo --type=diff --log-level-console=info backup
