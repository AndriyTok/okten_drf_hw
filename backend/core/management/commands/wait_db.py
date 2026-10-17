import time  # модуль для роботи із затримками
from typing import cast  # підказка для аналізатора типів для примусової типізації

from django.core.management.base import BaseCommand  # Базовий клас для створення власних Django-команд
from django.db import OperationalError, connection  # помилка підключення та обʼєкт для роботи з підключенням
from django.db.backends.mysql.base import DatabaseWrapper  # клас, що керує підключенням до конкретної БД

db_connection = cast(DatabaseWrapper, connection)
class Command(BaseCommand):
    # Метод, який виконується під час запуску команди
    def handle(self, *args, **options):
        self.stdout.write("Waiting for database...")
        # Прапорець, який показує, чи вдалося підʼєднатися до БД
        con_db = False

        # Повторюємо спроби, доки не підʼєднаємося до бази даних
        while not con_db:
            try:
                # Перевіряємо підключення до БД
                db_connection.ensure_connection()
                con_db = True
            except OperationalError:
                self.stdout.write("Database unavailable, wait 3 seconds...")
                # чекаємо 3 секунди перед наступною спробою
                time.sleep(3)

        self.stdout.write(self.style.SUCCESS("Database available!"))