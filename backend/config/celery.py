# Celery — це інструмент для виконання фонових і відкладених завдань поза основним процесом Django.
# Він дозволяє виконувати тривалі операції, наприклад надсилання електронних листів, обробку файлів або
# періодичне очищення бази даних, не затримуючи обробку HTTP-запитів.

# Config -> ./extra_conf/celery_conf.py

import os

# клас Celery для ств. екземпляра celery
from celery import Celery

# вказуємо django, який модуль налаштувань використовувати для екземпляра Celery
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

# Створюємо центральний обʼєкт. Аргумент функції - назва екземпляра Celery
app = Celery('settings')

# Беремо з налаштувань Django лише параметри, назви яких починаються з Celery
app.config_from_object('django.conf:settings', namespace='CELERY')

# Автоматично шукаємо завдання Celery у встановлених Django-apps
app.autodiscover_tasks()