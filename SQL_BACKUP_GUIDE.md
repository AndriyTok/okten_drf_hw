# MySQL Docker — Backup та Import

## Експорт

Створити backup бази даних з Docker-контейнера у файл `backup.sql`:

```bash
docker compose exec db mysqldump -u root -p НАЗВА_БД > backup.sql
```
## Імпорт
```bash
docker compose exec -T db mysql -u root -pПАРОЛЬ НАЗВА_БД < backup.sql
```