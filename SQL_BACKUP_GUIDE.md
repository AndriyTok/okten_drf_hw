# MySQL Docker — Backup та Import

## Експорт

Створити backup бази даних з Docker-контейнера у файл `backup.sql`:

```bash
docker compose exec db mysqldump -u root -p okten_drfHw_db > backup.sql
```
## Імпорт
```bash
docker compose exec -T db mysql -u root -proot_password123 okten_drfHw_db < backup.sql
```