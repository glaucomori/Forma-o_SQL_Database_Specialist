# Backup & Recovery

## Backup

---

O backup foi executado através do terminal no Windows usando as seguintes linhas de comando:

- Backup simples:

``` {.md}
cd C:\Program Files\MySQL\MySQL Server 8.0\bin

mysqldump --user root --password --databases ecommerce > ecommerce_backup.sql
```

- Backup incluindo rotinas e eventos:

``` {.md}
cd C:\Program Files\MySQL\MySQL Server 8.0\bin

mysqldump --routines --triggers -user root -password company > company_backup.sql
```

## Recovery

---

A recuperação dos bancos dados se deu através das linhas de comando a seguir:

``` {.md}
cd C:\Program Files\MySQL\MySQL Server 8.0\bin

mysql --user root --password < ecommerce_recovery.sql

mysql --user root --password < company_recovery.sql
```
