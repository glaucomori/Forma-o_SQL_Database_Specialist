# Transações, Backup e Recuperação de Banco de Dados

## Transações

As transações foram usadas para exemplicar sua aplicação na execução de modificações em banco de dados.

Alguns passos importantes:

- Desabilitar o autocommit.
- Criar transação contendo SQL statements.
- Criar transação contendo procedures incluindo verificação de erros e rollback.

---

## Backup

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

---

## Recovery

A recuperação dos bancos dados se deu através das linhas de comando a seguir:

``` {.md}
cd C:\Program Files\MySQL\MySQL Server 8.0\bin

mysql --user root --password < ecommerce_recovery.sql

mysql --user root --password < company_recovery.sql
```
