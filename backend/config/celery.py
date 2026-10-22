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

# Завантажуємо конфігурацію Celery з налаштувань Django (
app.config_from_object('django.conf:settings', namespace='CELERY')

# Автоматично шукаємо завдання Celery у встановлених Django-apps
app.autodiscover_tasks()

# Зразок зі спамом з лекції
# app.conf.beat_schedule = {
#     "send_spam_every_minute": {
#         'task': 'core.services.email_service.spam',
#         'schedule': crontab() # Пустий crontab() = повторення щохвилини
#         # 'args': (), # за потреби можна передавати позиційні аргументи (наприклад пошту та інше)
#     }
# } -> перенесено в core/tasks/schedule.py